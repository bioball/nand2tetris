lazy val assembler = project in file("../../06/assembler")
lazy val root = project in file(".")
  .dependsOn(assembler)
