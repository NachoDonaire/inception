

build:
	docker-compose -f ./srcs/docker-compose.yml up --build
	#docker build -t $(IMAGE) ./srcs/requirements/nginx/.

buildb:
	docker-compose -f ./srcs/docker-compose.yml up -d
runvol:
	docker run -p 443:443 -v /home/nkustoner/incepttione/myvol:/holi -it srcs_nginx /bin/bash
run:
	docker run -p 443:443 -it nginx /bin/bash
#	docker-compose -f ./srcs/docker-compose.yml run nginx

ps:
	docker-compose -f srcs/docker-compose.yml ps
down:
	docker-compose -f srcs/docker-compose.yml down
stop:
	docker-compose -f srcs/docker-compose.yml stop

rmallctnr:
	docker container rm $$(docker container ls -aq)
rmallvol:
	docker volume rm $$(docker volume ls -q)

reset: rmallctnr rmallvol


nginx:
	docker exec -it srcs_nginx_1 /bin/bash
wordpress:
	docker exec -it srcs_wordpress_1 /bin/bash
mariadb:
	docker exec -it srcs_mariadb_1 /bin/bash
