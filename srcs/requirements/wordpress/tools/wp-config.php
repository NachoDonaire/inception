<?php
define( 'DB_NAME', $WORDPRESS_DB_NAME );

/** Database username */
define( 'DB_USER', $WORDPRESS_DB_USER );

/** Database password */
define( 'DB_PASSWORD', $WORDPRESS_DB_PASSWORD );

/** Database hostname */
define( 'DB_HOST', mariadb_container );

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

'$table_prefix' = 'wp_';

define( 'WP_DEBUG', false );




if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';

