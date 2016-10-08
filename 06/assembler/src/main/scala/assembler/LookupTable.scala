package assembler

import scala.collection.mutable

/**
  * Created by danielchao on 10/8/16.
  */
class LookupTable[T] {

  val table = mutable.Map.empty[T, Int]

  def add(name: T, row: Int) = table += (name -> row)

  def addOnce(name: T, row: Int) = table.get(name) match {
    case Some(i) => table
    case None => add(name, row)
  }

  def get(name: T): Int = table.getOrElse(name, sys.error(s"Unable to fetch label with name $name"))

}
