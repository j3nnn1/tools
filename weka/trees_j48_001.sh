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
options="-i -M 2 -no-cv"
fi


echo 'path to the jar weka: '.$pathtoweka
echo 'path file to process: '.$file
echo 'where is the class'
echo 'interval used: '.$interval
echo 'confidencefactor: '.$confidencefactor
echo 'others options: '.$options
echo '-----------------------------------------------------'."\n"

confidencefactor="0.0"

cont=10

while [ $cont -le 501 ]; do 

	if [ $cont -gt 99 ]; then
		confidencefactor="0."
	fi
   	size=`java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file | grep Size`;
	correctly=`java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file | grep "Correctly Classified Instances"`;
	echo "FACTOR  DE CONFIANZA (-C):."  $confidencefactor$cont
	echo "Size:. " $size
	echo "Optiones:. $options"
	
	echo $correctly
	int_size="$(echo $size | awk '{print $6}')"
	int_cases="$(echo $correctly | awk '{print $4}')"
	prc_cases="$(echo $correctly | awk '{print $5}')"
	echo
	echo "#" factor confianza, tam_arbol, casos correctos, porcentaje
	echo "@" $confidencefactor$cont","$int_size","$int_cases","$prc_cases
	echo 
   	cont=`expr $cont + 10`
done
echo '---------------------------------------------------------------------------------------------------------------------------------'
echo 'Finish!.. almost..';
exit 0



