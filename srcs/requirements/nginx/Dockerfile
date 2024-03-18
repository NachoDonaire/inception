
#Get debian from repositories
FROM debian:bullseye

#Get dependencies for container
RUN apt-get update && apt-get upgrade && apt-get install vim -y && apt-get install net-tools -y && apt-get install nginx -y && apt-get install openssl -y && apt-get install telnet -y && apt-get install net-tools -y

#Set workdir
WORKDIR .

#VARIABLES
#ENV SSLPATH="/etc/nginx/ssl" \
 #   KEY="/etc/nginx/ssl/myserver.key" \
 #   CSR="/etc/nginx/ssl/myserver.crs" \
 #   DOMAIN_NAME="www.myserver.com"



#Copy some stuff
COPY ./tools/nginx.sh /usr/bin/
RUN chmod +x /usr/bin/nginx.sh
COPY ./tools/myNginx.conf /etc/nginx/nginx.conf

#Expose necessary ports

RUN mkdir /volumo
RUN echo "#This file is not the original nginx file, it has been removed for custom needs" > /etc/nginx/sites-enabled/default



#Generate private key and cert to sign request



#Sign the cert

#RUN cat /volumo/myNginx.conf > /etc/nginx/conf.d/myNginx.conf

#RUN chmod 644 /myNginx.conf
#RUN /myNginx.conf > /etc/nginx/nginx.conf

ENTRYPOINT ["/usr/bin/nginx.sh"]
#CMD ["tail", "-f"]
#ENTRYPOINT tail -f
