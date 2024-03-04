
IMAGE = tucosalamanca
CONTAINER = tucosalamanca

build:
	docker-compose -f ./srcs/docker-compose.yml up
	#docker build -t $(IMAGE) ./srcs/requirements/nginx/.

run:
	docker-compose -f ./srcs/docker-compose.yml run nginx

ps:
	docker-compose -f srcs/docker-compose.yml ps
down:
	docker-compose -f srcs/docker-compose.yml down
stop:
	docker-compose -f srcs/docker-compose.yml stop
