#! /bin/bash

#set -e

mkdir -p /run/php

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

file="/var/www/html/wp-config.php"

if [ -f "$file" ]; then
	exec /usr/sbin/php-fpm7.4 -F
	exit ;
fi

rm -rf /var/www/html/*


wp core download --allow-root --path=/var/www/html

echo "<?php" > /var/www/html/wp-config.php

echo "define( 'DB_NAME', '""$WORDPRESS_DB_NAME""' );

/** Database username */
define( 'DB_USER', '""$WORDPRESS_DB_USER""' );

/** Database password */
define( 'DB_PASSWORD', '""$WORDPRESS_DB_PASSWORD'"" );

/** Database hostname */
define( 'DB_HOST', '"$DB_HOST"');

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'yaketuke' );
define( 'SECURE_AUTH_KEY',  'yaketuke' );
define( 'LOGGED_IN_KEY',    'yaketuke' );
define( 'NONCE_KEY',        'yaketuke' );
define( 'AUTH_SALT',        'yaketuke' );
define( 'SECURE_AUTH_SALT', 'yaketuke' );
define( 'LOGGED_IN_SALT',   'yaketuke' );
define( 'NONCE_SALT',       'yaketuke' );

"'$table_prefix'" = 'wp_';

define( 'WP_DEBUG', false );




if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';" >> /var/www/html/wp-config.php


wp core install --url="$SITE_URL" --title=ndonaire_site --admin_user="$SITEA" --admin_password="$SITEAPSSWD" --admin_email="$SITEAMAIL" --path='/var/www/html/' --allow-root
	wp user create "$SITE_USER" "$SITE_USERMAIL" --role=author --path=/var/www/html/ --user_pass="$SITE_USERPSSWD" --allow-root > userInfo.txt

exec /usr/sbin/php-fpm7.4 -F
