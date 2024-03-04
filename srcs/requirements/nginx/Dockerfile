FROM debian:bookworm

RUN apt-get update && apt-get upgrade && apt-get install vim -y && apt-get install net-tools -y && apt-get install nginx -y && apt-get install openssl -y 

WORKDIR .

COPY Dockerfile .

COPY ./tools/nginx.sh /usr/bin/

EXPOSE 80/tcp

RUN chmod +x /usr/bin/nginx.sh

#ENTRYPOINT ["/usr/bin/nginx.sh"]
CMD ["/bin/bash"]
