#!/bin/bash
set -e

CONFILE="/etc/nginx/nginx.conf"

mkdir -p /etc/nginx/ssl

chmod 700 /etc/nginx/ssl

openssl req -newkey rsa:2048 -nodes -keyout $KEY -out $CSR -subj "/C=/ST=/L=/O=/OU=/CN=$DOMAIN_NAME/emailAdress="

openssl x509 -req -in $CSR -signkey $KEY -out $SSLPATH/myserver.crt



echo "user ndonaire;" > $CONFILE
echo 'worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
	# multi_accept on;
}

http {
	sendfile on;
	tcp_nopush on;
	types_hash_max_size 2048;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;
	ssl_prefer_server_ciphers on;

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	gzip on;

	upstream php {
    	server wordpress_container:9000;
	}
	server {
   	 	# Configuración del servidor HTTP en el puerto 443
    		listen 443 ssl;
    		server_name '"$DOMAIN_NAME"';
		ssl_certificate /etc/nginx/ssl/myserver.crt;
	        ssl_certificate_key /etc/nginx/ssl/myserver.key;
		ssl_protocols TLSv1.3;

		root /var/www/html/wordpress;
		index index.php index.html;

		location / {
			try_files $uri $uri/ /index.php?$args;
    		}

    		location ~ \.php$ {
        		fastcgi_pass php;
       			include fastcgi_params;
        		fastcgi_intercept_errors on;
        		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    		}


	}


}' > $CONFILE




nginx -g "daemon off;"
#tail -f

