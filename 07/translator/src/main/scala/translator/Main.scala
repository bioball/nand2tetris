package translator


import java.io.{PrintWriter, File}

import scala.io.Source

/**
 * Created by danielchao on 7/8/17.
 */
object Main {

  def writeFile(filename: String, src: String) = {
    val f = new File(filename)
    val p = new PrintWriter(f)
    p.print(src)
    p.close()
  }
  def main (args: Array[String]) = {
    val lines = Source.fromFile(args(0)).getLines().toSeq
    val commands = Parser.parse(lines)
    val asm = commands.mkString("\n\n//--------------------------------------\n\n")
    val filename = args(0).replaceAll("""\.vm""", ".asm")
    writeFile(filename, asm)
  }
}
