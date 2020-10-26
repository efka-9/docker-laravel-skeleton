FROM php:7.4-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

RUN addgroup -g 1337 innergroup
RUN adduser --no-create-home --disabled-password innerme
RUN addgroup innerme innergroup

USER innerme
