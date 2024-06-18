FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install php-fpm -y && apt-get install curl  -y && apt-get install util-linux -y && apt-get install iputils-ping -y && apt install ufw -y && apt install vim -y && apt install php-mysql -y

WORKDIR .


COPY ./tools/wp2.sh /usr/bin/wp.sh


RUN chmod +x /usr/bin/wp.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp


ENTRYPOINT ["/usr/bin/wp.sh"]
