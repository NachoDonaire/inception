FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install telnet -y && apt-get install net-tools -y && apt-get install php7.2 php7.2-fpm

EXPOSE 9000

ENTRYPOINT tail -f
