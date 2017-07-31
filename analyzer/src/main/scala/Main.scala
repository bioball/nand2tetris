import java.io.{PrintWriter, File}

import compiler.tokenizer.Tokenizer

import scala.io.Source

case class JackFile(src: List[Char], name: String)
/**
 * Created by danielchao on 7/29/17.
 */
object Main {
  def writeFile(filename: String, src: String) = {
    val f = new File(filename)
    val p = new PrintWriter(f)
    p.print(src)
    p.close()
  }

  def readFile(file: File): JackFile = {
    println(s"Reading in file ${file.getName}")
    val lines = Source
      .fromFile(file)
      .getLines()
      .toSeq
      .map(removeComments)
      .map(_.trim)
      .filterNot(_.isEmpty)
      .mkString("")
    JackFile(lines.replaceAll("""\/\*.*?\*\/""", "").toList, file.getName)
  }

  def readFiles(f: File): Seq[JackFile] = {
    if (f.isDirectory) {
      val files = f.listFiles()
      files.filter(_.getName.endsWith("jack")).map(readFile)
    } else {
      Seq(readFile(f))
    }
  }

  def removeComments(line: String) = if (line.indexOf("//") > -1) {
    line.substring(0, line.indexOf("//"))
  } else line

  def writeTokens(baseDir: String)(file: JackFile) = {
    val tokens = Tokenizer.doProcess(file.src)
    val stringified = Tokenizer.stringifyTokens(tokens)
    writeFile(s"$baseDir/${file.name.replaceAll("\\.jack", "")}T.xml", stringified)
  }

  def main(args: Array[String]) = {
    val input = new File(args(0))
    val directory = if (input.isDirectory) {
      input.getCanonicalPath
    } else {
      input.getParentFile.getCanonicalPath
    }
    val files = readFiles(input)
    files.foreach(writeTokens(directory))
  }
}
