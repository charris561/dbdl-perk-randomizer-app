#!/bin/bash
#Author: Caleb Harris
#Description: Setup script for laravel webapp to be run as entrypoint for docker

#change directories to the laravel app
cd /var/www/html/dbdl-laravel-app

#install dependencies
composer install

#create .env file > not in source control
cp .env.example .env

#use environment variables passed in by docker compose to configure .env
sed -i "s|^DB_CONNECTION=.*|DB_CONNECTION=${DB_CONNECTION}|" .env
sed -i "s|^DB_HOST=.*|DB_HOST=${DB_HOST}|" .env
sed -i "s|^DB_PORT=.*|DB_PORT=${DB_PORT}|" .env
sed -i "s|^DB_DATABASE=.*|DB_DATABASE=${DB_DATABASE}|" .env
sed -i "s|^DB_USERNAME=.*|DB_USERNAME=${DB_USERNAME}|" .env
sed -i "s|^DB_PASSWORD=.*|DB_PASSWORD=${DB_PASSWORD}|" .env
sed -i "s|^APP_ENV=.*|APP_ENV=${APP_ENV}|" .env
sed -i "s|^APP_URL=.*|APP_URL=${APP_URL}|" .env
sed -i "s|^APP_DEBUG=.*|APP_DEBUG=${APP_DEBUG}|" .env

#generate new app key
php artisan key:generate

#install npm
npm install
npm run build

#migrate DB
php artisan migrate -y

#install dependencies here such as python connectors

#run server
#php-fpm
apache2 -D FOREGROUND
