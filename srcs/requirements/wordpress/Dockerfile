FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install php-fpm -y && apt-get install curl  -y && apt-get install util-linux -y && apt-get install iputils-ping -y && apt install ufw -y && apt install vim -y

WORKDIR .


RUN mkdir -p /srv/www && chown www-data: /srv/www && curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www

RUN mkdir /volume

RUN useradd ndonaire

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wp.sh /usr/bin/wp.sh

RUN chmod +x /usr/bin/wp.sh


ENTRYPOINT ["/usr/bin/wp.sh"]
#ENTRYPOINT ["tail", "-f"]
