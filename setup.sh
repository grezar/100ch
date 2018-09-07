#!/bin/bash

function mysql_client() {
  mysql -u "$APP_100CH_DB_USER" -h "$APP_100CH_DB_HOST" -p"$APP_100CH_DB_PASSWORD" "$@"
}

# create databases
mysql_client < database/schema.sql

# create tables
for sql_file in $(ls -1 database/tables)
do
  echo "------------ Executing $(basename ${sql_file}) ------------"
  cat database/tables/${sql_file}
  mysql_client -D "100ch_production" < database/tables/${sql_file}
done
