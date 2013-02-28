

file=$1
if [ "x${1}" = "x" ]; then
	echo "Falta nombre de archivo del SCRIPT SQL a ejecutar"
	echo "./executeScriptSQL.sh ScripSQL.sql"
	exit
fi

psql -d recuperatorio -f $file
