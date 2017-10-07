#!/bin/bash
startTime=`date +%s`
dateTime=`date '+%Y_%m_%d-%H_%M_%S'`;
database=$1
database_type=$2
path="backups/"$database_type"/"

function MariaDB {
  docker exec Mariadb mysqldump -u root -psgc0609001all $database > $HOME"/"$path$database"_dump_"$dateTime.sql
}

function Postgres {
  docker exec Postgres pg_dump -U admin  $database > $HOME"/"$path$database"_dump_"$dateTime.sql
}

if [ -z $database ]; then
        echo "Which database would you like save?"
        read database
fi

if [ -z $database_type ]; then
        echo "Which database type would you like save (mariadb or pgsql)?"
        read database_type
fi

echo "Dump $database database"
  case "$database_type" in
    mariadb) MariaDB
    ;;
    pgsql) Postgres
    ;;
  esac
echo "Dump $database completed"

echo "Compressing $database"
cd $HOME"/"$path
tar zcvf $database"_dump_"$dateTime.sql".tar.gz" $database"_dump_"$dateTime.sql
echo "Compressing $database completed"

echo "Removing file"
rm $HOME"/"$path$database"_dump_"$dateTime.sql
echo "Removing completed"

endTime=`date +%s`
runtime=$((endTime - startTime))
echo "Execution time:" $runtime"s"
