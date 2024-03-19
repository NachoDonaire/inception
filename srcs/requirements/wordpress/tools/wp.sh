#! /bin/bash

set -e

mkdir -p /run/php

sed -i 's/mysqli.default_host =/mysqli.default_host = mariadb_container/g' etc/php/7.4/fpm/php.ini
sed -i "s/;extension=pdo_mysql/extension=pdo_mysql/g" etc/php/7.4/fpm/php.ini


chmod 755 /var/www/html
chmod 755 -R /var/www/html/
chown -R ndonaire:nogroup /var/www/html/


/usr/sbin/php-fpm7.4 -F
