#!/bin/bash
#	#bash_treedecision.sh 
#	#Path to weka.jar, received a path absolute 
#	#File to process, received a path absolute
#	#classpath 
#	#interval confidence factor
#	#Options
#	#args=$#
pathtoweka=$1
file=$2
classpath=$3
options=$5

if [ -z  $file ]; then
echo "usage ./bash_treedecision.sh <pathtoweka> <filetoprocess> <options>"
exit 1
fi

if [ -z $options ]; then
options="-M 2 -no-cv"
fi


echo 'path to the jar weka: '.$pathtoweka."\n"
echo 'path file to process: '.$file"\n"
echo 'where is the class'."\n"
echo 'interval used: '.$interval."\n"
echo 'confidencefactor: '.$confidencefactor."\n"
echo 'others options: '.$options."\n"
echo '-----------------------------------------------------'."\n"

confidencefactor="0.0"
inicio=1
fin=50


for (( cont=1; cont <=50; cont++))
do
   java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file
done

echo '---------------------------------------------------------------------------------------------------------------------------------'
echo 'Finish!.. almost..'"\n";
exit 0



