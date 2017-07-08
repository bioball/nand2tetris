lazy val assembler = ProjectRef(file("../../06/assembler"), "assembler")
lazy val root = project.in(file("."))
  .dependsOn(assembler)

scalaVersion := "2.11.6"

