package translator

/**
 * Created by danielchao on 7/8/17.
 */

object Segment {
  def unapply(src: String): Option[Segment] = src match {
    case "local" => Some(Local)
    case "args" => Some(Arg)
    case "this" => Some(This)
    case "that" => Some(That)
    case "static" => Some(Static)
    case "constant" => Some(Constant)
    case "temp" => Some(Temp)
    case other => None
  }
}
sealed trait Segment

sealed trait FixedSegment extends Segment {
  val register: Int
  val sgmt: Int
}
// allocate 2047 bits per segment.
case object Local extends FixedSegment {
  val register = 1
  val sgmt = 0x7ff + 1
}
case object Arg extends FixedSegment {
  val register = 2
  val sgmt = Local.sgmt * 2
}
case object This extends FixedSegment {
  val register = 3
  val sgmt = Local.sgmt * 3
}
case object That extends FixedSegment {
  val register = 4
  val sgmt = Local.sgmt * 4
}
case object Static extends Segment
case object Constant extends Segment
case object Temp extends Segment