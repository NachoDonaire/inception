FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install mariadb-server -y && apt-get install php-mariadb -y


COPY ./tools/mariadb.sh /usr/sbin/mariadb.sh

RUN chmod +x /usr/sbin/mariadb

#ENTRYPOINT tail -f
ENTRYPOINT ["./tools/mariadb.sh"]
