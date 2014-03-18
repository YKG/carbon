#!/bin/sh

(
	export CLASSPATH="."
    for i in ~/carbon/jar/*.jar
    do
        export CLASSPATH="$CLASSPATH":$i
    done
	for testName in `find -maxdepth 1 -type d -regex "\.\/.*" `
	do
		cd $testName
		rm -rf classes/ 2> /dev/null
		rm -rf smali/ 2> /dev/null
   		mkdir classes
		find src/ -type f -regex ".*\.java" | xargs javac -d classes 2>compileError.txt
		cd  classes/
		zip -q -r Main.jar *
		java -jar ~/carbon/jar/dx.jar --dex --output=classes.dex Main.jar
       	java -jar ~/carbon/jar/baksmali.jar -o ../smali/ classes.dex
       	realTestName=`echo $testName|cut -b 3-`
       	echo $realTestName
		realTestName2=`echo $realTestName|cut -b 5-`
		echo $realTestName2
		zip -q -r ~/carbon/test/VM2/${realTestName}/${realTestName2}".apk" classes.dex
		cd ../../
	done
)