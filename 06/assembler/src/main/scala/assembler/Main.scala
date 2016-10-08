package assembler

import java.io.{PrintWriter, File}

import scala.io.Source

/**
  * Created by danielchao on 9/27/16.
  */
object Main {

  val parser = new Parser()
  val formatter = new Formatter()

  def writeFile(filename: String, src: String) = {
    val f = new File(filename)
    val p = new PrintWriter(f)
    p.print(src)
    p.close()
  }

  def main (args: Array[String]): Unit = {
    val file = Source.fromFile(args(0)).mkString
    val ast = parser.parse(file)
    val output = formatter.format(ast)
    writeFile(args(1), output)
  }
}
