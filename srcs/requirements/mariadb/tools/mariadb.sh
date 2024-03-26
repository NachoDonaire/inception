#!/bin/bash


#set -e

#mkdir -p /run/mariadb



#chmod +xr mdb.init

echo "create user $USER;" > etc/mdb.sql
	
echo "GRANT ALL ON *.* TO '"$USER"'@'%' IDENTIFIED BY '"$WORDPRESS_DB_PASSWORD"'; FLUSH PRIVILEGES;" >>  /etc/mdb.sql

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME; GRANT ALL ON sitedb.* TO '"$USER"'@'%' IDENTIFIED BY '"$WORDPRESS_DB_PASSWORD"'; FLUSH PRIVILEGES" >> /etc/mdb.sql


#mariadb < /mdb.init

#service mariadb start
/etc/init.d/mariadb start

mariadb < /etc/mdb.sql
#/usr/sbin/mariadb
/etc/init.d/mariadb stop

mysqld
