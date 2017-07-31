package compiler.tokenizer

import enumeratum._

import scala.xml.Text

/**
 * Created by danielchao on 7/29/17.
 */
sealed trait Token {
  def tagName: String
  val value: String
  def toXML = <a/>.copy(label = tagName, child = Text(value))
}

// gotta be able to look ahead.
case class MaybeToken(token: String, lookahead: Option[Char])

object Token {
  def unapply(src: MaybeToken): Option[Token] = src match {
    case Symbol(sym) => Some(sym)
    case Keyword(key) => Some(key)
    case IntegerConstant(integer) => Some(integer)
    case StringConstant(stringConst) => Some(stringConst)
    case Identifier(ident) => Some(ident)
    case other => None
  }
}

sealed class Symbol(val value: String) extends EnumEntry with Token {
  val tagName = "symbol"
}

object Symbol extends Enum[Symbol] {
  val values = findValues
  case object LeftBrace extends Symbol("{")
  case object RightBrace extends Symbol("}")
  case object LeftParen extends Symbol("(")
  case object RightParen extends Symbol(")")
  case object LeftBracket extends Symbol("[")
  case object RightBracket extends Symbol("]")
  case object Dot extends Symbol(".")
  case object Comma extends Symbol(",")
  case object Semicolon extends Symbol(";")
  case object Plus extends Symbol("+")
  case object Minus extends Symbol("-")
  case object Multiply extends Symbol("*")
  case object Divide extends Symbol("/")
  case object Ampersand extends Symbol("&")
  case object LessThan extends Symbol("<")
  case object GreaterThan extends Symbol(">")
  case object Equals extends Symbol("=")
  case object Tilde extends Symbol("~")
  def unapply(src: MaybeToken) = values.find(_.value == src.token)
  def isSymbol(sym: Char) = values.exists(_.value == sym.toString)
}

sealed class Keyword(val value: String) extends EnumEntry with Token {
  val tagName = "keyword"
}

object Keyword extends Enum[Keyword] {
  val values = findValues
  case object Class extends Keyword("class")
  case object Constructor extends Keyword("constructor")
  case object Function extends Keyword("function")
  case object Method extends Keyword("method")
  case object Field extends Keyword("field")
  case object Static extends Keyword("static")
  case object Var extends Keyword("var")
  case object Int extends Keyword("int")
  case object Char extends Keyword("char")
  case object Boolean extends Keyword("boolean")
  case object Void extends Keyword("void")
  case object True extends Keyword("true")
  case object False extends Keyword("false")
  case object Null extends Keyword("null")
  case object This extends Keyword("this")
  case object Let extends Keyword("let")
  case object Do extends Keyword("do")
  case object If extends Keyword("if")
  case object Else extends Keyword("else")
  case object While extends Keyword("while")
  case object Return extends Keyword("return")
  def unapply(src: MaybeToken) = values.find(_.value == src.token)
}

case class IntegerConstant(value: String) extends Token {
 val tagName = "integerConstant"
}

object IntegerConstant {
  def isDigit(c: Char) = "1234567890".contains(c)
  
  def allDigits(src: String): Boolean = src.forall(isDigit)
  
  def unapply(src: MaybeToken): Option[IntegerConstant] = src match {
    case _ if src.token.isEmpty => None
    case s if allDigits(src.token) && !src.lookahead.exists(isDigit) => 
      Some(IntegerConstant(src.token))
    case _ => None
  }
}

case class Identifier(value: String) extends Token {
 val tagName = "identifier"
}

object Identifier {
  def startsWithLetter(src: String): Boolean = 
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(src.charAt(0))
  
  def unapply(src: MaybeToken): Option[Identifier] = src match {
    case _ if src.token.isEmpty => None
    case s if startsWithLetter(src.token) && src.lookahead.exists(Symbol.isSymbol) || src.lookahead.contains(' ') =>
      Some(Identifier(src.token))
    case _ => None
  }
}

case class StringConstant(value: String) extends Token {
  val tagName = "stringConstant"
}

object StringConstant {
  def unapply(src: MaybeToken): Option[StringConstant] = src match {
    case _ if src.token.isEmpty => None
    case s if src.token.charAt(0) == '"' && src.token.last == '"' => 
      Some(StringConstant(src.token.substring(1, src.token.length - 1)))
    case _ => None
  }
}