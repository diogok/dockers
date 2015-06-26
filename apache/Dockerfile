FROM debian:wheezy

RUN sed -i -e 's/http.debian.net/ftp.us.debian.org/g' /etc/apt/sources.list && \
    sed -i -e 's/httpredir/ftp.us/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install apache2 libapache2-mod-php5 php5 php5-cli php5-curl php5-common php5-sqlite php5-mysql php5-pgsql php5-gd curl git -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite 

RUN sed -i -e 's/memory_limit.*/memory_limit=512M/g' /etc/php5/apache2/php.ini && \
    sed -i -e 's/upload_max_filesize.*/upload_max_filesize=128M/g' /etc/php5/apache2/php.ini && \
    sed -i -e 's/post_max_size.*/post_max_size=128M/g' /etc/php5/apache2/php.ini && \
    sed -i -e 's/display_errors.*/display_erros=On/g' /etc/php5/apache2/php.ini


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/apache2.pid
ENV PHP_ENV production

ADD default.conf /etc/apache2/sites-available/default
RUN rm /var/www/* -Rf

RUN ln -sf /dev/stderr /var/log/apache2/error.log
RUN ln -sf /dev/stdout /var/log/apache2/access.log

EXPOSE 80

WORKDIR /var/www

CMD ["/usr/sbin/apache2","-D","FOREGROUND"]

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

