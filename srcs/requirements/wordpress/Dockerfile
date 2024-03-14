FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install php-fpm -y && apt-get install curl  -y && apt-get install util-linux -y && apt-get install iputils-ping -y && apt install ufw -y && apt install vim -y



RUN mkdir -p /srv/www && chown www-data: /srv/www && curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www

RUN mkdir /volume

RUN service php8.2-fpm start



ENTRYPOINT tail -f
