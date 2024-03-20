#!/bin/bash


set -e

#mkdir -p /run/mariadb

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;

CREATE USER ""'$USER'""@'wordpress_container' IDENTIFIED BY ""'$WORDPRESS_DB_PASSWORD'"";
GRANT ALL PRIVILEGES ON *.* TO ""'$USER'""@'wordpress_container' WITH GRANT OPTION;

CREATE USER ""'$PUSER'""@'wordpress_container' IDENTIFIED BY ""'$PPSWD'"";
GRANT SELECT, INSERT, UPDATE, DELETE ON $WORDPRESS_DB_NAME.* TO ""'$PUSER'""@'wordpress_container';" > /mdb.init


chmod +xr mdb.init

mariadb < /mdb.init

service mariadb start

#/usr/sbin/mariadb
tail -f
