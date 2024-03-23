#!/bin/bash


set -e

#mkdir -p /run/mariadb

/etc/init.d/mariadb start

chmod +xr mdb.init

echo "create user $USER" | mariadb

echo "GRANT ALL ON *.* TO '"$USER"'@'%' IDENTIFIED BY '"$WORDPRESS_DB_PASSWORD"'; FLUSH PRIVILEGES;" | mariadb

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME; GRANT ALL ON sitedb.* TO '"$USER"'@'%' IDENTIFIED BY '"$WORDPRESS_DB_PASSWORD"'; FLUSH PRIVILEGES" | mariadb


#mariadb < /mdb.init

#service mariadb start

#/usr/sbin/mariadb
/etc/init.d/mariadb stop

#tail -f
