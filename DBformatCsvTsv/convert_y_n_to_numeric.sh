
#Ojo con eso y las clases, resulto peor que la solucion

file=$1
if [ "x${1}" = "x" ]; then
	echo 'Parametros faltantes, ./convert_y_n_to_numeric.sh file.csv'
	exit
fi

sed 's/Y/1/g' $file > $file.tmp
sed 's/N/0/g' $file.tmp > $file.outsed
rm $file.tmp
echo 'finish!'

