up:
	source ./mysql_permisisons.sh
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
