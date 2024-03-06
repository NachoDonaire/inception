

build:
	docker-compose -f ./srcs/docker-compose.yml up --build
	#docker build -t $(IMAGE) ./srcs/requirements/nginx/.

run:
	docker run -p 443:443 -v /home/nkustoner/incepttione/myvol:/holi -it srcs_nginx /bin/bash
#	docker-compose -f ./srcs/docker-compose.yml run nginx

ps:
	docker-compose -f srcs/docker-compose.yml ps
down:
	docker-compose -f srcs/docker-compose.yml down
stop:
	docker-compose -f srcs/docker-compose.yml stop
