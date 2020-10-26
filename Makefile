SHELL := /bin/bash

up:
	make init-permissions
	docker-compose up -d --build

down:
	docker-compose down

ps:
	docker-compose ps

migrate:
	docker-compose run artisan migrate

npm-install:
	docker-compose run npm install

composer-install:
	docker-compose run composer install

composer-update:
	docker-compose run composer update

rerun:
	make down
	make up

init-permissions:
	sudo chown :1337 ./src && sudo chown :1337 ./mysql
	sudo chmod 775 ./src && sudo chmod 775 ./mysql
	sudo chmod g+s ./src && sudo chmod g+s ./mysql # all new directories will have 1337 group

