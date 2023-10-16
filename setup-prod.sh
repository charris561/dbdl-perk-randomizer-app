#!/bin/bash

#copy files to proper locations
cp dbdl-vhost.conf /etc/httpd/conf.d/dbdl-vhost.conf
cp -R src/dbdl-laravel-app/* /var/www/dbdl-laravel-app/

# change directories to the laravel_app
cd /var/www/dbdl-laravel-app

# install dependencies
/usr/local/bin/composer install

# create environment file
#cp .env.example .env

# use environment variables passed in by docker compose to 
#   configure .env file

#sed -i "s|^DB_CONNECTION=.*|DB_CONNECTION=${DB_CONNECTION}|" .env
#sed -i "s|^DB_HOST=.*|DB_HOST=${DB_HOST}|" .env
#sed -i "s|^DB_PORT=.*|DB_PORT=${DB_PORT}|" .env
#sed -i "s|^DB_DATABASE=.*|DB_DATABASE=${DB_DATABASE}|" .env
#sed -i "s|^DB_USERNAME=.*|DB_USERNAME=${DB_USERNAME}|" .env
#sed -i "s|^DB_PASSWORD=.*|DB_PASSWORD='${DB_PASSWORD}'|" .env
#sed -i "s|^APP_ENV=.*|APP_ENV=${APP_ENV}|" .env
#sed -i "s|^APP_URL=.*|APP_URL=${APP_URL}|" .env
#sed -i "s|^APP_DEBUG=.*|APP_DEBUG=${APP_DEBUG}|" .env

# generate new app key
php artisan key:generate

# install npm
npm install
npm run build

# migrate and seed database 
#php artisan migrate

# install dependencies for upload script
#pip3 install mysql-connector-python

#php-fpm
#httpd -D FOREGROUND

systemctl reload httpd
