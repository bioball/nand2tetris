name := "analyzer"

version := "1.0"

scalaVersion := "2.11.8"

lazy val analyzer = project.in(file("."))

libraryDependencies ++= Seq(
  "com.beachape" %% "enumeratum" % "1.5.2",
  "org.scala-lang.modules" %% "scala-xml" % "1.0.2"
)
