#!/bin/sh

release=20180130
base_url="https://github.com/stleary/JSON-java/archive"

classes="classes"

# --------------------

# Get src
curl -L $base_url/$release.tar.gz | tar zx
cd JSON-java-$release

# Compile
mkdir $classes
javac  *.java -d $classes

# Create jar
cd ..
jar cvfm json-java.jar META-INF/MANIFEST.MF -C JSON-java-$release/$classes/ .

