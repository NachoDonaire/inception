
FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install vim -y && apt-get install net-tools -y && apt-get install nginx -y && apt-get install openssl -y && apt-get install telnet -y && apt-get install net-tools -y

WORKDIR .



COPY ./tools/nginx.sh /usr/bin/
RUN chmod +x /usr/bin/nginx.sh
COPY ./tools/mynginx.conf /etc/nginx/nginx.conf




ENTRYPOINT ["/usr/bin/nginx.sh"]
#CMD ["tail", "-f"]
