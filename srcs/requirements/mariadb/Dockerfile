FROM debian:bullseye


ARG USER \
    WORDPRESS_DB_PASSWORD \
    WORDPRESS_DB_NAME  

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y && apt-get install mariadb-client &&  apt-get install mariadb-backup software-properties-common dirmngr -y

RUN chown -R  mysql:mysql /etc/mysql && chown -R mysql:mysql /var/lib/mysql /var/log/mysql

RUN sed -i "s/^bind-address\s*=.*/bind-address = 0.0.0.0/" "/etc/mysql/mariadb.conf.d/50-server.cnf" && \
    sed -i "/\[mysqld\]/a port = 3306\nsocket = /var/run/mysqld/mysqld.sock" "/etc/mysql/mariadb.conf.d/50-server.cnf"
    
RUN mysql_install_db

#instruccion a eliminar
#COPY ./tools/mariadb.sh /usr/bin/mariadb.sh

#COPY ./tools/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN mkdir -p /var/run/mysqld

#RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

#RUN chown -R  mysql:mysql /run/mysqld/ &&
#RUN echo "user : ${USER}"


#instruccion a eliminar
#RUN chmod +x /usr/bin/mariadb.sh


#RUN chmod +x /mdb.init

RUN 	echo "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};" > etc/mdb.sql && \
	echo "CREATE USER IF NOT EXISTS '${USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >> /etc/mdb.sql && \
	echo "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${USER}'@'%'; FLUSH PRIVILEGES;"  >> /etc/mdb.sql
#RUN echo "create user if not exists ${USER};" > etc/mdb.sql
#RUN echo "GRANT ALL ON *.* TO '"${USER}"'@'%' IDENTIFIED BY '"${WORDPRESS_DB_PASSWORD}"'; FLUSH PRIVILEGES;" >>  /etc/mdb.sql
#RUN echo "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME}; GRANT ALL ON sitedb.* TO '"${USER}"'@'%' IDENTIFIED BY '"${WORDPRESS_DB_PASSWORD}"'; FLUSH PRIVILEGES;" >> /etc/mdb.sql


RUN service mariadb start && mariadb < "/etc/mdb.sql" && service mariadb stop

ENTRYPOINT ["mysqld"]
#ENTRYPOINT ["tail", "-f"]
