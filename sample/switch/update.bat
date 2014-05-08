javac *.java
java -jar D:\repo\carbon\jar\dx.jar --dex --output=classes.dex *.class
java -jar D:\repo\carbon\jar\baksmali.jar -o smali classes.dex