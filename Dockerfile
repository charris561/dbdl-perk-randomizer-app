FROM php:8.2.11-apache

#install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install zip unzip git npm nodejs -y && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

#copy source and setup script
COPY src/ /var/www/html/
COPY setup.sh /opt/
RUN chmod +x /opt/setup.sh

#configure apache
COPY dbdl-vhost.conf /etc/apache2/sites-available
RUN chgrp -R www-data /var/www/html && \ 
    find /var/www/html -type d -exec chmod g+rx {} + && \ 
    find /var/www/html -type f -exec chmod g+r {} + && \
    chown -R www-data /var/www/html && \
    a2ensite dbdl-vhost && \ 
    a2dissite 000-default

#expose port 80
EXPOSE 80

#start apache
CMD apachectl -D FOREGROUND