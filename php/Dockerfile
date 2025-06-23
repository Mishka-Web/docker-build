FROM php:8.1-fpm

RUN apt-get update && apt-get install -y     libzip-dev zip unzip git curl     libpng-dev libjpeg-dev libfreetype6-dev     libxml2-dev libonig-dev     && docker-php-ext-install pdo_mysql mbstring zip gd xml

RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html