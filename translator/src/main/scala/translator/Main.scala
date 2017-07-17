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
    println(s"Reading in file ${file.getName}")
    val lines = Source
      .fromFile(file)
      .getLines()
      .toSeq
      .map(removeComments)
      .map(_.trim)
      .filterNot(_.isEmpty)
    VMFile(lines, file.getName)
  }

  def readFiles(f: File): Seq[VMFile] = {
    if (f.isDirectory) {
      val files = f.listFiles()
      files.filter(_.getName.endsWith("vm")).map(readFile)
    } else {
      Seq(readFile(f))
    }
  }

  def writeAsmBlock(block: VMFile) = block
    .lines
    .zipWithIndex
    .map({ case (line, idx) => Command.toAsm(line, block.filename, idx) })

  def outFileName(in: String) = {
    val f = new File(in)
    if (f.isDirectory) {
      val filename = f.getName + ".asm"
      f.getCanonicalPath + "/" + filename
    } else {
      val filename = f.getName
      f.getParentFile.getCanonicalPath + "/" + filename.replaceAll("\\.vm", "") + ".asm"
    }
  }

  def removeComments(line: String) = line.split("""\/\/""").toSeq match {
    case Seq(src, cmt) => src
    case Seq(src) => src
    case _ => line
  }

  /**
   * If the input is a directory, we need to write the startup code. Otherwise, we can skip.
   */
  def writeProgram(cmds: Seq[String], isDirectory: Boolean) = if (isDirectory) {
    (Seq(Startup.writeAsm) ++ cmds).mkString("\n")
  } else {
    cmds.mkString("\n")
  }

  def main (args: Array[String]) = {
    val input = new File(args(0))
    val files = readFiles(input)
    val asm = files.flatMap(writeAsmBlock)
    val outfile = outFileName(args(0))
    writeFile(outfile, writeProgram(asm, input.isDirectory))
    println(s"Wrote ${asm.length} commands to $outfile")
  }
}
