#!/bin/bash

origen=$1
destino=$2

if [ "x${1}" = "x" ]; then
	echo 'Parametros incompletos: '
	echo './convertTSVtoCSV fileIN.tsv fileCSV.csv'
	exit
fi

if [ "x${2}" = "x" ]; then
	echo 'Parametros incompletos: '
	echo './convertTSVtoCSV fileIN.tsv fileCSV.csv'
	exit
fi

tr "\t" "," < $origen > $destino
