lazy val translator = project.in(file("."))
  .settings(mainClass in assembly := Some("translator.Main"))
  .settings(assemblyJarName in assembly := "translator.jar")
  .settings(test in assembly := {})

scalaVersion := "2.11.8"