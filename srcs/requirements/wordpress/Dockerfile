FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install php-fpm -y && apt-get install curl  -y && apt-get install util-linux -y && apt-get install iputils-ping -y && apt install ufw -y && apt install vim -y && apt install php-mysql -y

WORKDIR .


RUN useradd ndonaire
RUN useradd nkush

RUN mkdir -p /srv/www && chown ndonaire: /srv/www && curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www

RUN mkdir /volume
RUN mkdir -p /var/www/html



COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wp2.sh /usr/bin/wp.sh
COPY ./tools/index.php /srv/www/wordpress/index.php


RUN chmod +x /usr/bin/wp.sh
#RUN chown -R root:root /var/www/html/wp-config.php



ENTRYPOINT ["/usr/bin/wp.sh"]
#ENTRYPOINT ["tail", "-f"]
