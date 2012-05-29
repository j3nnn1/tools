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
confidencefactor="0.0"
cont=25

echo "size_tree,leaves,confianza,percen_correct,cant_correct"
while [ $cont -le 501 ]; do 
	if [ $cont -gt 75 ]; then
		confidencefactor="0."
	fi
	#echo "java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file"
   	size=`java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file | grep "Size"`;
   	leaves=`java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file | grep "Leaves"`;
	correctly=`java -classpath $pathtoweka weka.classifiers.trees.J48 -C $confidencefactor$cont $options -t $file | grep "Correctly Classified Instances"`;
	int_size="$(echo $size | awk '{print $6}')"
	int_leaves="$(echo $leaves | awk '{print $5}')"
	int_cases="$(echo $correctly | awk '{print $4}')"
	prc_cases="$(echo $correctly | awk '{print $5}')"
	echo "$int_size, $int_leaves, $confidencefactor$cont, $prc_cases, $int_cases"	
   	cont=`expr $cont + 25`
done
exit 0



