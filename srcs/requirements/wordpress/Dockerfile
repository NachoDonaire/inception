FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install php-fpm -y && apt-get install curl  -y && apt-get install util-linux -y && apt-get install iputils-ping -y && apt install ufw -y && apt install vim -y && apt install php-mysql -y && apt-get install wordpress -y

WORKDIR .

#RUN mkdir -p /srv/www && chown www-data:www-data /srv/www && curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www

#RUN mkdir /volume



 #COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wp2.sh /usr/bin/wp.sh
#COPY ./tools/index.php /srv/www/wordpress/index.php


RUN chmod +x /usr/bin/wp.sh
#RUN chown -R root:root /var/www/html/wp-config.php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp


#RUN /usr/bin/wp.sh
#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/usr/bin/wp.sh"]
