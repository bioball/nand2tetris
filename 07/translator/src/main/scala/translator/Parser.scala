package translator

import scala.util.matching.Regex

/**
 * Created by danielchao on 7/8/17.
 */
object Parser {
  def parse(lines: Seq[String]): Seq[Command] = lines.flatMap(Command.unapply)
}