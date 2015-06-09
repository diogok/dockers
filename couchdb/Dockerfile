FROM ubuntu:14.04 

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:couchdb/stable -y && \
    apt-get update && \
    apt-get install couchdb -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /etc/couchdb/local.ini
RUN mkdir /var/run/couchdb
ADD json.ini /etc/couchdb/local.d/json.ini

EXPOSE 5984
VOLUME ["/var/lib/couchdb"]
CMD [ "couchdb" ]

