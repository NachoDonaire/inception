FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install vim -y && apt-get install mariadb-server -y && apt-get install mariadb-client

WORKDIR .

COPY ./tools/mariadb.sh /usr/sbin/mariadb.sh
COPY ./tools/server.conf etc/mysql/mariadb.conf.d/50-server.cnf

#COPY ./tools/mdb.init /mdb.init

RUN chmod +x /usr/sbin/mariadb.sh

RUN mkdir -p /var/run/mysqld

RUN useradd ndonaire
RUN useradd nkush
#RUN chmod +x /mdb.init

ENTRYPOINT ["/usr/sbin/mariadb.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]
ENTRYPOINT tail -f
