FROM diogok/apache

RUN apt-get update && apt-get -y install libspatialite-dev spatialite-bin libspatialite5 sqlite3 php5-sqlite php5-pgsql gdal-bin gdal-contrib && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cp /usr/lib/x86_64-linux-gnu/libspatialite.so /usr/lib/php5/20131226 && \
    sed -i -e 's/;sqlite3.extension_dir =/sqlite3.extension_dir = \/usr\/lib\/php5\/20131226/' /etc/php5/apache2/php.ini && \
    sed -i -e 's/;sqlite3.extension_dir =/sqlite3.extension_dir = \/usr\/lib\/php5\/20131226/' /etc/php5/cli/php.ini


