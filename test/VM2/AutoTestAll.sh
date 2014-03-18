#!/bin/sh

(
	export CLASSPATH="."
    for i in ~/carbon/jar/*.jar
    do
        export CLASSPATH="$CLASSPATH":$i
    done
	for testName in `find -maxdepth 1 -type d -regex "\.\/.*" `
	do
		realTestName=`echo $testName|cut -b 3-`
   		realTestName2=`echo $testName|cut -b 7-`
   		cd ~/carbon
		java -classpath /home/rocky/carbon/out/production/carbon:$CLASSPATH Carbon -dump astvm ~/carbon/test/VM2/${realTestName}/${realTestName2}".apk" 1>~/carbon/test/VM2/${realTestName}/result.txt 2>~/carbon/test/VM2/${realTestName}/error.txt
		cd test/VM2
	done
)