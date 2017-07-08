package translator

object Command {
  val PUSH_REGEX = """^push\s(\w+)\s(\d+)$""".r
  val POP_REGEX = """^pop\s(\w+)\s(\d+)$""".r
  def unapply(unparsed: String): Option[Command] = unparsed match {
    case "add" => Some(Add)
    case "sub" => Some(Subtract)
    case PUSH_REGEX(segment, idx) => Segment.unapply(segment).map(Push(_, idx.toInt))
    case POP_REGEX(segment, idx) => Segment.unapply(segment).map(Pop(_, idx.toInt))
    case other => None
  }
}

/**
 * Created by danielchao on 7/8/17.
 */
sealed trait Command
case object Add extends Command {
  override def toString =
    """
      |// *** add ***
      |
      |// Get value of M[SP-1], store in D
      |@SP
      |A=A-1
      |D=M
      |
      |// Get value of M[SP-2]. Add to D.
      |A-A-1
      |D=M+D
      |@SP
      |A=A-1
      |
      |// Set value of M[SP-2] to D.
      |M=D
      |
      |// Set M[0] to SP-2.
      |@SP
      |M=A
    """.stripMargin
}
case object Subtract extends Command {
  override def toString =
    """
      |// *** sub ***
      |
      |// Get value of M[SP-1], store in D
      |@SP
      |A=A-1
      |D=M
      |
      |// Get value of M[SP-2]. Subtract to D.
      |A-A-1
      |D=M-D
      |D=!D // need to negate here, because we're subtracting in reverse order.
      |@SP
      |A=A-1
      |
      |// Set value of M[SP-2] to D.
      |M=D
      |
      |// Set M[0] to SP-2.
      |@SP
      |M=A
    """.stripMargin
}

case class Push(segment: Segment, index: Int) extends Command {
  override def toString = segment match {
    case sgmt: FixedSegment =>
      s"""
        |// *** push $segment $index
        |$segment
      """.stripMargin
    case other =>
      "// TODO"
  }
}

case class Pop(segment: Segment, index: Int) extends Command