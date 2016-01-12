FROM diogok/java8

RUN curl https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.1.1/elasticsearch-2.1.1.deb \
    --insecure -o /root/elasticsearch-2.1.1.deb 

RUN apt-get update && apt-get install adduser && \
    dpkg -i /root/elasticsearch-2.1.1.deb && rm /root/elasticsearch-2.1.1.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/elasticsearch/config && \
    cp -a /etc/elasticsearch/* /usr/share/elasticsearch/config && \
    mkdir /usr/share/elasticsearch/logs && \
    mkdir /usr/share/elasticsearch/data && \
    mkdir /usr/share/elasticsearch/config/templates && \
    chown -R elasticsearch.elasticsearch /usr/share/elasticsearch/*

ENV ES_HOME "/usr/share/elasticsearch"
ENV ES_USER "elasticsearch"
USER elasticsearch

WORKDIR /usr/share/elasticsearch

VOLUME ["/usr/share/elasticsearch/data"]

EXPOSE 9200 9300

COPY elasticsearch.yml /usr/share/elasticsearch/config

CMD ["bin/elasticsearch"]

