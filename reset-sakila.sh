#!/usr/bin/env bash

SAKILA_DIRNAME="sakila-db"
SAKILA_ARCHIVE_NAME="${SAKILA_DIRNAME}.tar.gz"
SAKILA_URL="https://downloads.mysql.com/docs/sakila-db.tar.gz"
INITDB_DIRNAME=init_db_scripts

echo "Downloading the database..."
wget -q --show-progress -O ${SAKILA_ARCHIVE_NAME} ${SAKILA_URL}

echo "Extracting archive..."
tar -xzf ${SAKILA_ARCHIVE_NAME}

echo "Putting files in place..."
mkdir -p ${INITDB_DIRNAME}
mv ./sakila-db/sakila-schema.sql ./${INITDB_DIRNAME}/1-sakila-schema.sql
mv ./sakila-db/sakila-data.sql ./${INITDB_DIRNAME}/2-sakila-data.sql

echo "All done!"
