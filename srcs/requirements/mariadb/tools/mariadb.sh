#!/bin/bash


set -e


echo "create user $USER;" > etc/mdb.sql
	
echo "GRANT ALL ON *.* TO '"$USER"'@'%' IDENTIFIED BY '"$WORDPRESS_DB_PASSWORD"'; FLUSH PRIVILEGES;" >>  /etc/mdb.sql

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME; GRANT ALL ON sitedb.* TO '"$USER"'@'%' IDENTIFIED BY '"$WORDPRESS_DB_PASSWORD"'; FLUSH PRIVILEGES" >> /etc/mdb.sql



chown mysql:mysql /run/mysqld/

mysql_install_db

/etc/init.d/mariadb start

mariadb < /etc/mdb.sql
/etc/init.d/mariadb stop

exec mysqld
