#!/bin/sh

if [ $# != 1 ]
then
	echo "Usage: $0 projectName"
else
	tools=~/"carbon/jar"
	folder=~/"$1/out/production/$1"
	output=~/"smaliTest"

	rm -r $output/smali$1 2>/dev/null
	cd $folder
	zip -q -r $output/Main.jar *
        cd $output
	java -jar $tools/dx.jar --dex --output=classes.dex Main.jar
        java -jar $tools/baksmali.jar -o $output/smali$1/ classes.dex
fi		
