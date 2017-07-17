package translator

object Command {
  final val PUSH_REGEX = """^push\s(\w+)\s(\d+)\s?.*""".r
  final val POP_REGEX = """^pop\s(\w+)\s(\d+)\s?.*""".r
  final val LABEL_REGEX = """^label\s(\w+)\s?.*""".r
  final val IF_GOTO_REGEX = """^if-goto\s(\w+)\s?.*""".r
  final val GOTO_REGEX = """^goto\s(\w+)\s?.*""".r
  final val FUNCTION_REGEX = """^function\s([\w\.]+)\s(\d+)?.*""".r
  final val RETURN_REGEX = """^return.*""".r
  final val CALL_REGEX = """^call\s([\w\.]+)\s(\d+)\s?.*""".r
  var functionContext: Seq[String] = Nil
  def parse(unparsed: String, filename: String, index: Int): Command = {
    unparsed match {
      case "add" => Add
      case "sub" => Subtract
      case "eq" => Equals(index)
      case "lt" => LessThan(index)
      case "gt" => GreaterThan(index)
      case "neg" => Negative
      case "and" => And
      case "or" => Or
      case "not" => Not
      case IF_GOTO_REGEX(label) => IfGoto(label, Some(filename))
      case GOTO_REGEX(label) => Goto(label, Some(filename))
      case LABEL_REGEX(label) => Label(label, Some(filename))
      case PUSH_REGEX(segment, idx) =>
        val seg = Segment.unapply(segment).get
        Push(seg, idx.toInt, filename)
      case POP_REGEX(segment, idx) =>
        val seg = Segment.unapply(segment).get
        Pop(seg, idx.toInt, filename)
      case FUNCTION_REGEX(functionName, nValues) =>
        functionContext ++= Seq(functionName)
        FunctionCommand(functionName, nValues.toInt)
      case RETURN_REGEX() =>
        functionContext = functionContext.slice(0, functionContext.length - 1)
        ReturnCommand
      case CALL_REGEX(fnName, nArgs) =>
        CallCommand(fnName, nArgs.toInt, Some(filename), index)
    }
  }

  def toAsm(unparsed: String, filename: String, index: Int): String = {
    val cmd = parse(unparsed, filename, index)
    s"""
      |// *** $unparsed
      |
      |${cmd.writeAsm}
    """.stripMargin
  }
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

trait LabelCommand extends Command {
  val label: String
  val fnContext: Option[String]
  val labelName = s"${fnContext.getOrElse("")}$$$label"
}

case class Label(label: String, fnContext: Option[String]) extends LabelCommand {
  override def writeAsm =
    s"""
      |($labelName)
    """.stripMargin
}

case class IfGoto(label: String, fnContext: Option[String]) extends LabelCommand {
  override def writeAsm =
    s"""
      |@SP
      |M=M-1 // SP--
      |A=M
      |D=M // get the topmost value of the stack, and store it in D.
      |@$labelName
      |D;JNE // if D is not 0, jump.
    """.stripMargin
}

case class Goto(label: String, fnContext: Option[String]) extends LabelCommand {
  override def writeAsm =
    s"""
      |@$labelName
      |0;JMP
    """.stripMargin
}

case class FunctionCommand(functionName: String, nLocalVars: Int) extends Command {

  val initLocalVars = for (i <- 0 until nLocalVars) yield {
    Push(Constant, 0, "").writeAsm
  }

  override def writeAsm =
    s"""
      |($functionName)
      |// init local variables x $nLocalVars.
      |${initLocalVars.mkString("\n")}
    """.stripMargin
}

case object ReturnCommand extends Command {

  def restoreSegment(segment: FixedSegment, positionBack: Int) =
    s"""
      |// ${segment.register} = *(FRAME-$positionBack)
      |@$positionBack
      |D=A
      |@R15
      |A=M-D
      |D=M // D = *(FRAME-$positionBack)
      |${segment.register}
      |M=D
    """.stripMargin

  override def writeAsm =
    s"""
      |// FRAME = LCL.
      |// we'll use R15 as FRAME.
      |@LCL
      |D=M
      |@R15
      |M=D
      |
      |// RET = *(FRAME - 5).
      |// we'll use R14 as RET.
      |@5
      |D=A
      |@R15
      |A=M-D
      |D=M // D = *(FRAME - 5)
      |
      |@R14
      |M=D // @R14 is RET.
      |
      |// pop arg 0
      |${Pop(Arg, 0, "").writeAsm}
      |
      |// SP = ARG + 1
      |@ARG
      |D=M
      |@SP
      |M=D+1
      |
      |${restoreSegment(That, 1)}
      |${restoreSegment(This, 2)}
      |${restoreSegment(Arg, 3)}
      |${restoreSegment(Local, 4)}
      |
      |// goto RET
      |@R14
      |A=M
      |0;JMP
    """.stripMargin
}

case class CallCommand(fnName: String, nArgs: Int, fnContext: Option[String], cmdIdx: Int) extends Command {
  val returnAddressLabel = s"${fnContext.getOrElse("")}$$ret_$cmdIdx"

  def push(address: String) = {
    s"""
      |$address
      |D=M
      |
      |@SP
      |A=M
      |M=D // put that address at the top of the stack
      |@SP
      |M=M+1 // increment stack pointer
    """.stripMargin
  }

  override def writeAsm =
    s"""
      |// push return address.
      |@$returnAddressLabel
      |D=A // get address that we should return to, store in D
      |@SP
      |A=M
      |M=D // put that address at the top of the stack
      |@SP
      |M=M+1 // increment stack pointer
      |
      |// push LCL
      |${push("@LCL")}
      |
      |// push ARG
      |${push("@ARG")}
      |
      |// push THIS
      |${push("@THIS")}
      |
      |// push THAT
      |${push("@THAT")}
      |
      |// ARG = SP - n - 5
      |@SP
      |D=M
      |@$nArgs
      |D=D-A // SP - n
      |@5
      |D=D-A // SP - n - 5
      |@ARG
      |M=D
      |
      |// LCL = SP
      |@LCL
      |@SP
      |D=M
      |@LCL
      |M=D
      |
      |// goto function
      |@$fnName
      |0;JMP
      |
      |// create label for return address
      |($returnAddressLabel)
    """.stripMargin
}

object Startup extends Command {
  override def writeAsm =
    s"""
      |// initialize SP to 256
      |@256
      |D=A
      |@SP
      |M=D
      |
      |${CallCommand("Sys.init", 0, None, 0).writeAsm}
    """.stripMargin
}
