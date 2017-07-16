package assembler

import scala.annotation.tailrec

/**
  * Created by danielchao on 9/30/16.
  * Takes an AST of the Hack Assembly Language, and outputs machine code as a string.
  */
class Formatter {

  import Parser._

  val labelTable = new LookupTable[Label]()
  labelTable.add(Label("SCREEN"), 16384)
  labelTable.add(Label("KBD"), 24576)
  labelTable.add(Label("SP"), 0)
  labelTable.add(Label("LCL"), 1)
  labelTable.add(Label("ARG"), 2)
  labelTable.add(Label("THIS"), 3)
  labelTable.add(Label("THAT"), 4)

  val variableTable = new LookupTable[String]()


  def format (ast: Seq[Command]): String = {
    parseLabels(ast)
    parseVariables(ast)
    stripLabels(ast)
      .map(parseRawCommands)
      .mkString("\n")
  }

  /**
    * Iterate through the AST, and create a table of labels and the correct row numbers.
    */
  def parseLabels (ast: Seq[Command]) = {
    var count = 0
    ast.foreach {
      case cmd: Label =>
        labelTable.add(cmd, count)
      case _ => count += 1
    }
  }

  def parseVariables (ast: Seq[Command]) = {
    var count = 16
    ast foreach {
      case cmd: AVariableCommand =>
        variableTable.addOnce(cmd.name, count)
        count += 1
      case _ => null // no-op. This is just here to avoid a compiler warning.
    }
  }

  /**
    * Remove all label commands from the AST.
    */
  def stripLabels(ast: Seq[Command]) = ast.filterNot {
    case cmd: Label => true
    case _ => false
  }

  def parseRawCommands(cmd: Command) = cmd match {
    case cmd: ACommand => formatACommand(cmd)
    case cmd: CCommand => formatCCommand(cmd)
    case _ => sys.error(s"Got a weird non-command: $cmd")
  }

  def toBinary(n: Int): String = {
    @tailrec
    def binary(acc: String, n: Int): String = {
      n match {
        case 0 | 1 => n + acc
        case _ => binary((n % 2) + acc, n / 2)
      }
    }
    padZeroes(binary("", n))
  }

  def padZeroes(b: String): String = b.reverse.padTo(15, "0").reverse.mkString

  def getRawAValue(cmd: ACommand) = cmd match {
    case cmd: ALiteralCommand => cmd.value
    case cmd: ALabelCommand => labelTable.get(cmd.label)
    case cmd: AVariableCommand => variableTable.get(cmd.name)
  }

  def formatACommand(cmd: ACommand) = "0" + toBinary(getRawAValue(cmd))

  def formatCCommand(cmd: CCommand) = Seq(
    "111",
    cmd.computation.binaryString,
    formatDestination(cmd.dest),
    cmd.jump.binaryString
  ).mkString("")

  def formatDestination(dest: Seq[Register]) = Seq(ARegister, DRegister, MRegister)
    .map { register => if (dest.contains(register)) "1" else "0" }.mkString("")

}
