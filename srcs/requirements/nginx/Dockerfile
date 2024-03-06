
#Get debian from repositories
FROM debian:bookworm

#Get dependencies for container
RUN apt-get update && apt-get upgrade && apt-get install vim -y && apt-get install net-tools -y && apt-get install nginx -y && apt-get install openssl -y 

#Set workdir
WORKDIR .

#VARIABLES
ENV SSLPATH="/etc/nginx/ssl" \
    KEY="/etc/nginx/ssl/myserver.key" \
    CSR="/etc/nginx/ssl/myserver.crs" \
    DOMAIN_NAME="www.myserver.com"



#Copy some stuff
COPY ./tools/nginx.sh /usr/bin/
COPY ./tools/myNginx.conf /etc/nginx/conf.d/

#Expose necessary ports
EXPOSE 443/tcp

#RUN chmod +x /usr/bin/nginx.sh
RUN mkdir /etc/nginx/ssl
RUN mkdir /kajuto
#VOLUME /etc/nginx
RUN chmod 700 /etc/nginx/ssl



#Generate private key and cert to sign request
RUN openssl req -newkey rsa:2048 -nodes -keyout $KEY -out $CSR -subj "/C=/ST=/L=/O=/OU=/CN=$DOMAIN_NAME/emailAdress="



#Sign the cert
RUN openssl x509 -req -in $CSR -signkey $KEY -out $SSLPATH/myserver.crt


#RUN chmod 644 /myNginx.conf
#RUN /myNginx.conf > /etc/nginx/nginx.conf

#ENTRYPOINT ["/usr/bin/nginx.sh"]
CMD ["/bin/bash"]
