
# sh uploadModel.sh MODEL 
modelo=$1

if [ "x${1}" = "x" ]; then
        echo 'Parametros faltantes, sh uploadModel.sh MODEL'
        exit
fi

echo "alter table cred add column $model NUMBER" > tmp.sql

psql -d recuperatorio -f tmp.sql

rm tmp.sql

echo "finish!"

