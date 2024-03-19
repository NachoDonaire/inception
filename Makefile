

build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d
	#docker build -t $(IMAGE) ./srcs/requirements/nginx/.


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


re: down build
nginx:
	docker exec -it nginx_container /bin/bash
wordpress:
	docker exec -it wordpress_container /bin/bash
mariadb:
	docker exec -it mariadb_container /bin/bash
