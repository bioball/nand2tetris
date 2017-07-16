package translator


import java.io.{PrintWriter, File}

import scala.io.Source


case class VMFile(lines: Seq[String], filename: String)

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

  def readFile(file: File): VMFile = {
    val lines = Source.fromFile(file).getLines().toSeq
    VMFile(lines, file.getName)
  }

  def readFiles(src: String): Seq[VMFile] = {
    val f = new File(src)
    if (f.isDirectory) {
      val files = f.listFiles()
      files.map(readFile)
    } else {
      Seq(readFile(f))
    }
  }

  def writeAsmBlock(block: VMFile) = block
    .lines
    .zipWithIndex
    .flatMap({ case (line, idx) => Command.toAsm(line, block.filename, idx) })

  def outFileName(in: String) = {
    val f = new File(in)
    f.getName.split("""\.""").head + ".asm"
  }

  def main (args: Array[String]) = {
    val files = readFiles(args(0))
    val asm = files.flatMap(writeAsmBlock)
    val outfile = outFileName(args(0))
    writeFile(outfile, asm.mkString("\n\n"))
    println(s"Wrote ${asm.length} commands to $outfile")
  }
}
