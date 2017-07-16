lazy val translator = project.in(file("."))
  .settings(mainClass in assembly := Some("translator.Main"))
  .settings(assemblyJarName in assembly := "translator.jar")
  .settings(test in assembly := {})

scalaVersion := "2.11.8"

// https://mvnrepository.com/artifact/commons-io/commons-io
libraryDependencies += "commons-io" % "commons-io" % "2.5"
