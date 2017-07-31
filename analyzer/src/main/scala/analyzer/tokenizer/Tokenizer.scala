package analyzer.tokenizer

import scala.annotation.tailrec
import scala.xml.PrettyPrinter

/**
 * Parses Jack programs into a set of tokens.
 */
object Tokenizer {
  
  // keep taking until the candidate looks like a token. Each token class is responsible for knowing whether it's a token or not.
  @tailrec
  final def doProcess(remaining: List[Char], candidate: String = "", tokens: Seq[Token] = Nil): Seq[Token] = {
    if (remaining.isEmpty) {
      return tokens
    }
    // if it's whitespace, we can ignore.
    if (candidate == " ") {
      doProcess(remaining.tail, remaining.head.toString, tokens)
    } else {
      MaybeToken(candidate, remaining.headOption) match {
        case Token(tok) =>
          doProcess(remaining.tail, remaining.head.toString, tokens :+ tok)
        case _ => 
          doProcess(remaining.tail, candidate + remaining.head, tokens)
      }
    }
  }
  
  def stringifyTokens(tokens: Seq[Token]): String = {
    val printer = new PrettyPrinter(80, 2)
    printer.format(<tokens>{tokens.map(_.toXML)}</tokens>)
  }
  
}
