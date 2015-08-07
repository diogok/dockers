FROM diogok/java8

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libxml2-dev libxslt1-dev libjpeg-dev gettext git python-dev python-pip && \
    apt-get install -y python-pillow python-lxml python-psycopg2 python-django python-bs4 python-multipartposthandler transifex-client python-paver python-nose python-django-nose python-gdal python-django-pagination python-django-jsonfield python-django-extensions python-django-taggit python-httplib2 && \
    apt-get install -y --force-yes ant maven2 --no-install-recommends

RUN git clone https://github.com/geonode/geonode /geonode
WORKDIR /geonode

RUN pip install -e /geonode
RUN paver setup

RUN apt-get purge -y ant maven2 build-essential && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/geoserver/geonode-data/"]
EXPOSE 8000
CMD ["paver", "start", "-b 0.0.0.0:8000","-f"]

