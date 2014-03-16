#!/bin/sh

(
	export CLASSPATH="."
	cd ../..
    for i in jar/*.jar
    do
        export CLASSPATH="$CLASSPATH":$i
    done
    cd test/VM2/
	for testName in `find -maxdepth 1 -type d -regex "\.\/.*" `
	do
		cd $testName
		rm -rf classes/ 2> /dev/null
		rm -rf smali/ 2> /dev/null
   		mkdir classes
		find src/ -type f -regex ".*\.java" | xargs javac -d classes
		cd  classes/
		zip -q -r Main.jar *
		java -jar ~/carbon/jar/dx.jar --dex --output=classes.dex Main.jar
        java -jar ~/carbon/jar/baksmali.jar -o ../smali/ classes.dex
    	cd ../../
	done
)






