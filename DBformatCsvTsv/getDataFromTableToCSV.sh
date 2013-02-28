
#sh getDataFromTableToCSV.sh cred /media/misperoles/git/tools/converCSVToCreateSQL/salida.out
table=$1
output=$2

if [ "x${1}" = "x" ]; then
	echo 'Parametros faltantes, ./getDataFromTableToCSV.sh nameTable fileout.csv'
	exit
fi

if [ "x${2}" = "x" ]; then
	echo 'Parametros faltantes, ./convert_y_n_to_numeric.sh nameTable fileout.csv'
	exit
fi


echo ' COPY  '$table" TO '"$output"' WITH CSV HEADER" > sql.tmp

psql -d recuperatorio -f sql.tmp

rm sql.tmp

echo 'finish!'

