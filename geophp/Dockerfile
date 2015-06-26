FROM diogok/apache

RUN apt-get update 
RUN apt-get -y install libspatialite-dev php5-sqlite php5-pgsql gdal-bin gdal-contrib && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sed -i -e 's/;sqlite3.extension_dir =/sqlite3.extension_dir = \/usr\/lib\/php5\/20100525/' /etc/php5/apache2/php.ini
RUN cp /usr/lib/libspatialite.so /usr/lib/php5/20100525


