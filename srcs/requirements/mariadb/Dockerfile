FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install vim -y && apt-get install mariadb-server -y

WORKDIR .

COPY ./tools/mariadb.sh /usr/sbin/mariadb.sh

#COPY ./tools/mdb.init /mdb.init

RUN chmod +x /usr/sbin/mariadb.sh

RUN useradd ndonaire
RUN useradd nkush
#RUN chmod +x /mdb.init

ENTRYPOINT tail -f
ENTRYPOINT ["/usr/sbin/mariadb.sh"]
