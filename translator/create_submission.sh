#!/usr/bin/env bash

sbt assembly
mv -f ./target/scala-2.11/translator.jar ./submission/translator.jar
cd ./submission/
zip -r ../project8.zip ./*