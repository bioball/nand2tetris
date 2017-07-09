#!/usr/bin/env bash

sbt assembly
mv -f ./target/scala-2.11/translator.jar ./submission/translator.jar
zip -r project7.zip ./submission/*