#! /bin/bash

set -e

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F
