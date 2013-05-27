#--- select id_cliente
#--- from creditosenvioid
#--- where a2 > 0.02
#--- select sum(ganancia) from d_test
#--- where a4 > 0.02
#--- select sum(ganancia) as ganancia, sum(ganancia) * 3.3333333333333335 * 1.0526315789473684 as ganancia_estimada
#--- from d_test
#--- where a2>0.02

#sh getGain.sql A1 /media/misperoles/git/tools/DBformatCsvTsv/A1.gain
#--- #ensembles promedios 

modelo=$1
ruta=$2

if [ "x${1}" = "x" ]; then
        echo 'Parametros faltantes, ./getDataFromTableToCSV.sh nameTable fileout.csv'
        exit
fi

if [ "x${2}" = "x" ]; then
        echo 'Parametros faltantes, ./convert_y_n_to_numeric.sh nameTable fileout.csv'
        exit
fi

echo 'COPY (select sum(c.ganancia) as ganancia, sum(ganancia) * 3.3333333333333335 * 1.0526315789473684 as ganancia_estimada
from cred c
where c.training = 2
and c.'$modelo ' > 0.02 ) TO "'$ruta/$modelo'_GAIN.csv" WITH CSV;' > tmp.sql


psql -d recuperatorio -f tmp.sql


rm tmp.sql


echo 'COPY (select id from cred c where c.'$modelo'>0.02 AND c.training=0) TO "'$ruta/$modelo'_IDs.csv" WITH CSV;' > tmp.sql;

psql -d recuperatorio -f tmp.sql

rm tmp.sql

echo 'finish!'







