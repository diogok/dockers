FROM debian:stretch

RUN apt-get update && \
    apt-get install -y apt-transport-https lsb-release ca-certificates wget && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install nginx php7.2 php7.2-common php7.2-json php7.2-mysql php7.2-curl php7.2-gd php7.2-pdo php7.2-zip php7.2-xml php7.2-pdo-mysql php7.2-pdo-pgsql php7.2-pdo-sqlite php7.2-mysql php7.2-pgsql php7.2-sqlite3 php7.2-fpm php7.2-xdebug php7.2-mbstring -y --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/php

EXPOSE 80
VOLUME /var/www
WORKDIR /var/www

COPY site.conf /etc/nginx/sites-available/default
COPY index.php /var/www/html/index.php

RUN sed -i -e 's/;clear_env/clear_env/' /etc/php/7.2/fpm/pool.d/www.conf && \
    sed -i -e 's/memory_limit.*/memory_limit=512M/g' /etc/php/7.2/fpm/php.ini && \
    sed -i -e 's/upload_max_filesize.*/upload_max_filesize=128M/g' /etc/php/7.2/fpm/php.ini && \
    sed -i -e 's/post_max_size.*/post_max_size=128M/g' /etc/php/7.2/fpm/php.ini && \
    sed -i -e 's/display_errors.*/display_erros=On/g' /etc/php/7.2/fpm/php.ini && \
    sed -i -e 's/max_execution_time = 30/max_execution_time = 900/g' /etc/php/7.2/fpm/php.ini && \
    echo 'request_terminate_timeout = 900' >> /etc/php/7.2/fpm/pool.d/www.conf

COPY run.sh /opt/run.sh
CMD ["/opt/run.sh"]

#RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

