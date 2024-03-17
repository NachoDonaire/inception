FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install mariadb-server -y

EXPOSE 9000

ENTRYPOINT tail -f
