FROM debian:jessie

RUN apt-get update && apt-get upgrade -y && apt-get install wget -y
RUN echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list
RUN wget https://www.dotdeb.org/dotdeb.gpg && apt-key add dotdeb.gpg
RUN apt-get update

RUN apt-get install nginx php7.0 php7.0-common php7.0-json php7.0-mysql php7.0-curl php7.0-gd php7.0-mysql php7.0-pgsql php7.0-sqlite3 php7.0-fpm supervisor -y

RUN mkdir /var/run/php

RUN echo 'daemon off;' >> /etc/nginx/nginx.conf

COPY site.conf /etc/nginx/sites-available/default
COPY index.php /var/www/html/index.php
COPY supervisor.conf /etc/supervisor/conf.d/base.conf

EXPOSE 80
VOLUME /var/www

CMD ["supervisord"]

