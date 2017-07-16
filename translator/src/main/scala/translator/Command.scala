package translator

object Command {
  val PUSH_REGEX = """^push\s(\w+)\s(\d+)$""".r
  val POP_REGEX = """^pop\s(\w+)\s(\d+)$""".r
  def parse(unparsed: String, filename: String, index: Int): Option[Command] = unparsed match {
    case "add" => Some(Add)
    case "sub" => Some(Subtract)
    case "eq" => Some(Equals(index))
    case "lt" => Some(LessThan(index))
    case "gt" => Some(GreaterThan(index))
    case "neg" => Some(Negative)
    case "and" => Some(And)
    case "or" => Some(Or)
    case "not" => Some(Not)
    case PUSH_REGEX(segment, idx) => Segment.unapply(segment).map(Push(_, idx.toInt, filename))
    case POP_REGEX(segment, idx) => Segment.unapply(segment).map(Pop(_, idx.toInt, filename))
    case other => None
  }
}

/**
 * Created by danielchao on 7/8/17.
 */
sealed trait Command

abstract class ArithmeticCommand(symbol: String) extends Command {
  override def toString =
    s"""
      |// *** arithmetic $symbol ***
      |
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
  override def toString =
    s"""
      |// *** comparison: $jmpCmd ***
      |
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
  override def toString =
    s"""
       |// *** combination: $combination ***
       |
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
  override def toString =
    s"""
      |// *** flip: $flip ***
      |
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
  override def toString = segment match {
    case sgmt: FixedSegment =>
      s"""
        |// *** push $segment $index
        |
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
         |// *** push $sgmt $index
         |
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
         |// *** push constant $index
         |
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
  override def toString = segment match {
    case sgmt: FixedSegment =>
      s"""
        |// *** pop $segment $index
        |
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
         |// *** pop $sgmt $index
         |
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