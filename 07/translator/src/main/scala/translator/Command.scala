package translator

object Command {
  val PUSH_REGEX = """^push\s(\w+)\s(\d+)$""".r
  val POP_REGEX = """^pop\s(\w+)\s(\d+)$""".r
  def parse(unparsed: String, filename: String): Option[Command] = unparsed match {
    case "add" => Some(Add)
    case "sub" => Some(Subtract)
//    case "eq" =>
//    case "lt" =>
//    case "gt" =>
//    case "neg" =>
//    case "and" =>
//    case "or" =>
//    case "not" =>
    case PUSH_REGEX(segment, idx) => Segment.unapply(segment).map(Push(_, idx.toInt, filename))
    case POP_REGEX(segment, idx) => Segment.unapply(segment).map(Pop(_, idx.toInt, filename))
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
      |M=M-1 // Decrement stack pointer.
      |A=M // Get address of pointer, store in A.
      |D=M // Get value at pointer address, store in D.
      |
      |// Get value of M[SP-2]. Add to D.
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // get address of pointer, store in A.
      |M=M+D // store result back at register.
      |
      |@SP
      |M=M+1 // Increment stack pointer.
    """.stripMargin
}

case object Subtract extends Command {
  override def toString =
    """
      |// *** sub ***
      |
      |// Get value of M[SP-1], store in D
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // Get address of pointer, store in A.
      |D=M // Get value at pointer address, store in D.
      |
      |// Get value of M[SP-2]. Add to D.
      |@SP
      |M=M-1 // Decrement stack pointer.
      |A=M // get address of pointer, store in A.
      |M=M-D // get value at pointer address, and subtract D from it. Store value in M.
      |
      |@SP
      |M=M+1 // Increment stack pointer.
    """.stripMargin
}

case object Equals extends Command {
  override def toString =
    """
      |// *** eq ***
      |
    """.stripMargin
}

case class Push(segment: Segment, index: Int, filename: String) extends Command {
  override def toString = segment match {
    case sgmt: FixedSegment =>
      s"""
        |// *** push $segment $index
        |
        |@$index
        |D=A // Store $index in D
        |${sgmt.register}
        |A=M+D // get address of base register for ${sgmt.register}, and add $index to it. Send to A.
        |D=M // Get the value of index $index of $segment and store as D.
        |
        |@SP
        |A=M // Get SP's current address
        |M=D // set value of current SP address to D (which is $index position of $segment)
        |
        |@SP
        |M=M+1 // Increment stack pointer
      """.stripMargin
    case sgmt: PredeterminedSegment =>
      val register = sgmt.register(index, filename)
      s"""
         |// *** push $sgmt $index
         |
         |$register
         |D=M
         |
         |@SP
         |A=M
         |M=D
         |
         |@SP
         |M=M+1
       """.stripMargin
    case Constant =>
      s"""
         |// *** push constant $index
         |
         |@$index
         |D=A // set D to $index
         |@SP
         |A=M
         |M=D // set value at stack pointer's address to $index
         |@SP
         |M=M+1 // increment stack pointer
       """.stripMargin
    case other =>
      s"""
         |// *** TODO: push $other
       """.stripMargin
  }
}

case class Pop(segment: Segment, index: Int, filename: String) extends Command {
  override def toString = segment match {
    case sgmt: FixedSegment =>
      s"""
        |// *** pop $segment $index
        |
        |// get index $index of the $segment segment, store in ${sgmt.register}
        |@$index
        |D=A
        |${sgmt.register}
        |D=D+M // set the target address of our popped value in D
        |
        |// store the target address in R13.
        |@R13
        |M=D
        |
        |@SP
        |M=M-1 // decrement stack pointer
        |A=M // set A to value contained at address referenced by stack pointer.
        |D=M // get the value at that address, store in D
        |
        |@R13
        |A=M
        |M=D // store our popped value in the target address.
      """.stripMargin
    case sgmt: PredeterminedSegment =>
      val register = sgmt.register(index, filename)
      s"""
         |// *** pop $sgmt $index
         |
         |@SP
         |M=M-1
         |A=M
         |D=M
         |
         |$register
         |M=D
       """.stripMargin
    case Constant => sys.error("It don't make no sense to pop to constants bruh")
  }
}