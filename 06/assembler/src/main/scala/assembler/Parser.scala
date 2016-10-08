package assembler

/**
  * Created by danielchao on 9/27/16.
  */

object Parser {
  sealed trait Command
  case class CCommand(dest: Seq[Register], computation: Computation, jump: JumpCommand) extends Command
  sealed trait ACommand extends Command
  case class ALiteralCommand(value: Int) extends ACommand
  case class AVariableCommand(name: String) extends ACommand
  case class ALabelCommand(label: Label) extends ACommand
  case class Label(name: String) extends Command

  sealed trait Register
  case object ARegister extends Register
  case object MRegister extends Register
  case object DRegister extends Register

  case class JumpCommand(binaryString: String)
  case class Computation(binaryString: String)

}

/**
  * Parses the Hack Assembly Language into an AST. In our case, this is just a seq of either ACommand or CCommand.
  */
class Parser {

  import Parser._

  private val CCommandRegex = """^(?!@)([AMD]{0,3}=)?([\w\+\-\!\&\|]{1,3});?(\w{0,3})$""".r
  private val ACommandLiteralRegex = """^@(\d+)$""".r
  private val ACommandRegisterRegex = """^@[rR](\d+)$""".r
  private val ACommandLabelRegex = """^@([A-Z0-9_\.]+)$""".r
  private val LabelRegex = """^\(([a-zA-Z0-9_\.]+)\)$""".r
  private val ACommandVariableRegex = """^@([a-z0-9_\.]+)$""".r

  def removeComments(line: String) = line.split("""\/\/""").toSeq match {
    case Seq(src, cmt) => src
    case Seq(src) => src
    case _ => line
  }

  def removeWhitespace(src: String) = src.replace(" ", "")

  def parse(src: String) = src
    .split("\r\n")
    .toSeq
    .map(removeComments)
    .map(removeWhitespace)
    .filterNot(_.isEmpty)
    .map(parseCommand)

  def parseCommand(src: String): Command = src match {
    case CCommandRegex(dest, computation, jump) =>
      CCommand(
        dest = parseDest(dest),
        computation = parseComputation(computation),
        jump = parseJumpCommand(jump)
      )
    case ACommandLiteralRegex(value) =>
      ALiteralCommand(value = value.toInt)
    case ACommandRegisterRegex(value) =>
      ALiteralCommand(value = value.toInt)
    case ACommandLabelRegex(value) =>
      ALabelCommand(Label(value))
    case LabelRegex(value) =>
      Label(value)
    case ACommandVariableRegex(value) =>
      AVariableCommand(value)
  }

  def parseDest(src: String): Seq[Register] = Option(src).map { dest =>
    dest.filterNot(_ == '=').split("").toSeq.map {
      case "A" => ARegister
      case "D" => DRegister
      case "M" => MRegister
      case other => sys.error(s"Found a weird register destination: $other")
    }
  }.getOrElse(Seq.empty)

  def parseJumpCommand(src: String): JumpCommand = src match {
    case null => JumpCommand("000")
    case "" => JumpCommand("000")
    case "JGT" => JumpCommand("001")
    case "JEQ" => JumpCommand("010")
    case "JGE" => JumpCommand("011")
    case "JLT" => JumpCommand("100")
    case "JNE" => JumpCommand("101")
    case "JLE" => JumpCommand("110")
    case "JMP" => JumpCommand("111")
  }

  def parseComputation(src: String): Computation = src match {
    case "0" => Computation("0101010")
    case "1" => Computation("0111111")
    case "-1" => Computation("0111010")
    case "A" => Computation("0110000")
    case "M" => Computation("1110000")
    case "D" => Computation("0001100")
    case "A+1" => Computation("0110111")
    case "D+1" => Computation("0011111")
    case "M+1" => Computation("1110111")
    case "A-1" => Computation("0110010")
    case "M-1" => Computation("1110010")
    case "D-1" => Computation("0001110")
    case "D+M" => Computation("1000010")
    case "D-M" => Computation("1010011")
    case "D+A" => Computation("0000010")
    case "D-A" => Computation("0010011")
    case "M-D" => Computation("1000111")
    case "A-D" => Computation("0000111")
    case "!D" => Computation("0001101")
    case "!A" => Computation("0110001")
    case "!M" => Computation("1110001")
    case "D&M" => Computation("1000000")
    case "D&A" => Computation("0000000")
    case "D|M" => Computation("1010101")
    case "D|A" => Computation("0010101")
  }

}
