FROM registry.access.redhat.com/ubi9/php-81:latest

USER 0

#install updates and dependencies
RUN yum --disableplugin=subscription-manager -y update \
    && yum --disableplugin=subscription-manager -y install unzip git npm python3 python3-pip \
    && yum --disableplugin=subscription-manager clean all

#install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

#configure apache
RUN echo "Listen *:80" >> /etc/httpd/conf/httpd.conf
COPY ./dbdl-vhost.conf /etc/httpd/conf.d

#copy source 
COPY ./src/dbdl-laravel-app /var/www/dbdl-laravel-app
COPY ./setup.sh /var/www/dbdl-laravel-app

#give apache access to serve application
RUN chown -R apache:apache /var/www/dbdl-laravel-app \
    && chmod -R 755 /var/www/dbdl-laravel-app

#start apache
CMD ["httpd", "-D", "FOREGROUND"]
