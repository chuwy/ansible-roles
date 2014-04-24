#!/bin/bash

# check connection
psql --username=postgres -c 'select 1'
if [[ $? != 0 ]] ; then
    echo "skipped"
    exit 0
fi

if ! $(psql --username=postgres template1 -c 'SHOW SERVER_ENCODING' | grep -q UTF8); then
    psql --username=postgres postgres -c "update pg_database set datallowconn = TRUE where datname = 'template0';"
    psql --username=postgres template0 -c "update pg_database set datistemplate = FALSE where datname = 'template1';"
    psql --username=postgres template0 -c "drop database template1;"
    psql --username=postgres template0 -c "create database template1 with template = template0 encoding = 'UTF8' lc_ctype = 'en_US.UTF-8' lc_collate = 'en_US.UTF-8';"
    psql --username=postgres template0 -c "update pg_database set datistemplate = TRUE where datname = 'template1';"
    psql template1 -c "update pg_database set datallowconn = FALSE where datname = 'template0';"
    echo "changed"
else
    echo "skipped"
fi
