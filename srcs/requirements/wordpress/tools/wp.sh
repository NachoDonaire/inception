#! /bin/bash

set -e

mkdir -p /run/php

sed -i 's/mysqli.default_host =/mysqli.default_host = mariadb_container/g' etc/php/7.4/fpm/php.ini

/usr/sbin/php-fpm7.4 -F
