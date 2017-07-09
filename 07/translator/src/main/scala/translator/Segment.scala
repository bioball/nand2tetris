package translator

/**
 * Created by danielchao on 7/8/17.
 */

sealed trait Segment

/**
 * Fixed Segments store a pointer to their base address at `register`.
 * Writing/reading requires dereferencing that address and adding the index to get the target
 * register
 */
sealed trait FixedSegment extends Segment {
  val register: String
}

/**
 * Predetermined Segments are set by convention. The translator has a hard set of rules for which
 * exact register to write/read into.
 */
sealed trait PredeterminedSegment extends Segment {
  def register(index: Int, filename: String): String
}

case object Local extends FixedSegment {
  override val register = "@1"
}
case object Arg extends FixedSegment {
  override val register = "@2"
}
case object This extends FixedSegment {
  override val register = "@3"
}
case object That extends FixedSegment {
  override val register = "@4"
}

case object Pointer extends PredeterminedSegment {
  def register(index: Int, filename: String) = index match {
    case 0 => This.register
    case 1 => That.register
  }
}
case object Temp extends PredeterminedSegment {
  def register(index: Int, filename: String) = s"@${index + 5}"
}
case object Static extends PredeterminedSegment {
  def register(index: Int, filename: String) = s"@$filename.$index"
}
case object Constant extends Segment

object Segment {
  def unapply(src: String): Option[Segment] = src match {
    case "local" => Some(Local)
    case "argument" => Some(Arg)
    case "this" => Some(This)
    case "that" => Some(That)
    case "static" => Some(Static)
    case "constant" => Some(Constant)
    case "temp" => Some(Temp)
    case "pointer" => Some(Pointer)
    case other => None
  }
}
