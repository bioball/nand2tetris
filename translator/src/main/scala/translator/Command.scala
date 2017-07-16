package translator

object Command {
  val PUSH_REGEX = """^push\s(\w+)\s(\d+)""".r
  val POP_REGEX = """^pop\s(\w+)\s(\d+)""".r
  val LABEL_REGEX = """^label\s(\w+)""".r
  val IF_GOTO_REGEX = """^if-goto\s(\w+)""".r
  val GOTO_REGEX = """^goto\s(\w+)""".r
  def parse(unparsed: String, filename: String, index: Int): Option[Command] = {
    unparsed match {
      case "add" => Some(Add)
      case "sub" => Some(Subtract)
      case "eq" => Some(Equals(index))
      case "lt" => Some(LessThan(index))
      case "gt" => Some(GreaterThan(index))
      case "neg" => Some(Negative)
      case "and" => Some(And)
      case "or" => Some(Or)
      case "not" => Some(Not)
      case IF_GOTO_REGEX(label) => Some(IfGoto(label))
      case GOTO_REGEX(label) => Some(Goto(label))
      case LABEL_REGEX(label) => Some(Label(label))
      case PUSH_REGEX(segment, idx) => Segment.unapply(segment).map(Push(_, idx.toInt, filename))
      case POP_REGEX(segment, idx) => Segment.unapply(segment).map(Pop(_, idx.toInt, filename))
      case other => None
    }
  }

  def toAsm(unparsed: String, filename: String, index: Int): Option[String] = parse(unparsed, filename, index).map(cmd =>
    s"""
      |// *** $unparsed
      |
      |${cmd.writeAsm}
    """.stripMargin)
}

/**
 * Created by danielchao on 7/8/17.
 */
sealed trait Command {

  def writeAsm: String

}


abstract class ArithmeticCommand(symbol: String) extends Command {
  override def writeAsm =
    s"""
      |// Get value of M[SP-1], store in D
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // Get address of pointer, store in A.
      |D=M // Get value at pointer address, store in D.
      |
      |// Get value of M[SP-2]
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // get address of pointer, store in A.
      |M=M${symbol}D // get value at pointer address, and perform computation. Store value in M.
      |
      |@SP
      |M=M+1 // Increment stack pointer.
    """.stripMargin
}

// index is passed in so we can make the labels unique.
abstract class ComparisonCommand(jmpCmd: String, index: Int) extends Command {
  override def writeAsm =
    s"""
      |// Get value of M[SP-1], store in R13
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // Get address of pointer, store in A.
      |D=M // Get value at pointer address, store in D.
      |@R13 // save to R13.
      |M=D
      |
      |// Get value of M[SP-2]. Store in D.
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // get address of pointer, store in A.
      |D=M
      |@R13
      |D=D-M // subtract M[SP-1] from M[SP-2]
      |
      |@COMPARETRUE_$index // need to make these labels unique.
      |D;$jmpCmd // Jump based off comparison to D.
      |// if we reach here, the comparison has failed.
      |@SP
      |A=M
      |M=0
      |@END_$index
      |0;JMP
      |(COMPARETRUE_$index)
      |@SP
      |A=M
      |M=-1
      |(END_$index)
      |@SP
      |M=M+1 // Increment stack pointer.
    """.stripMargin
}

abstract class CombiningCommand(combination: String) extends Command {
  override def writeAsm =
    s"""
       |// Get value of M[SP-1], store in D
       |@SP
       |M=M-1 // Decrement stack pointer.
       |A=M // Get address of pointer, store in A.
       |D=M // Get value at pointer address, store in D.
       |
       |// Get value of M[SP-2]. Add to D.
       |@SP
       |M=M-1 // Decrement stack pointer.
       |A=M // get address of pointer, store in A.
       |
       |//
       |D=M${combination}D
       |@SP
       |A=M
       |M=D
       |
       |@SP
       |M=M+1 // Increment stack pointer.
    """.stripMargin
}

abstract class FlippingCommand(flip: String) extends Command {
  override def writeAsm =
    s"""
      |// Get value of M[SP-1], store in D
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // Get address of pointer, store in A.
      |M=${flip}M // flip it!
      |
      |@SP
      |M=M+1 // increment stack pointer.
    """.stripMargin
}

case object Add extends ArithmeticCommand("+")
case object Subtract extends ArithmeticCommand("-")
case class Equals(index: Int) extends ComparisonCommand("JEQ", index)
case class LessThan(index: Int) extends ComparisonCommand("JLT", index)
case class GreaterThan(index: Int) extends ComparisonCommand("JGT", index)
case object And extends CombiningCommand("&")
case object Or extends CombiningCommand("|")
case object Negative extends FlippingCommand("-")
case object Not extends FlippingCommand("!")

case class Push(segment: Segment, index: Int, filename: String) extends Command {
  override def writeAsm = segment match {
    case sgmt: FixedSegment =>
      s"""
        |@$index
        |D=A // Store $index in D
        |${sgmt.register}
        |A=M+D // get address of base register for ${sgmt.register}, and add $index to it. Send to A.
        |D=M // Get the value of index $index of $segment and store as D.
        |
        |@SP
        |A=M // Get SP's current address
        |M=D // set value of current SP address to D (which is $index position of $segment)
        |
        |@SP
        |M=M+1 // Increment stack pointer
      """.stripMargin
    case sgmt: PredeterminedSegment =>
      val register = sgmt.register(index, filename)
      s"""
         |$register
         |D=M
         |
         |@SP
         |A=M
         |M=D
         |
         |@SP
         |M=M+1
       """.stripMargin
    case Constant =>
      s"""
         |@$index
         |D=A // set D to $index
         |@SP
         |A=M
         |M=D // set value at stack pointer's address to $index
         |@SP
         |M=M+1 // increment stack pointer
       """.stripMargin
  }
}

case class Pop(segment: Segment, index: Int, filename: String) extends Command {
  override def writeAsm = segment match {
    case sgmt: FixedSegment =>
      s"""
        |// get register that we should pop into, store at @R13.
        |@$index
        |D=A
        |${sgmt.register}
        |D=D+M // set the target address of our popped value in D
        |@R13
        |M=D
        |
        |@SP
        |M=M-1 // decrement stack pointer
        |A=M // set A to value contained at address referenced by stack pointer.
        |D=M // get the value at that address, store in D
        |
        |// store our popped value in the target address.
        |@R13
        |A=M
        |M=D
      """.stripMargin
    case sgmt: PredeterminedSegment =>
      val register = sgmt.register(index, filename)
      s"""
         |@SP
         |M=M-1
         |A=M
         |D=M
         |
         |$register
         |M=D
       """.stripMargin
    case Constant => sys.error("It don't make no sense to pop to constants bruh")
  }
}

case class Label(name: String) extends Command {
  override def writeAsm =
    s"""
      |($name)
    """.stripMargin
}

case class IfGoto(label: String) extends Command {
  override def writeAsm =
    s"""
      |@SP
      |M=M-1 // SP--
      |A=M
      |D=M // get the topmost value of the stack, and store it in D.
      |@$label
      |D;JNE // if D is not 0, jump.
    """.stripMargin
}

case class Goto(label: String) extends Command {
  override def writeAsm =
    s"""
      |@$label
      |0;JMP
    """.stripMargin
}
