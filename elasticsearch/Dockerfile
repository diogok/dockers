FROM diogok/java8:zulu

RUN curl https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.0/elasticsearch-2.4.0.deb \
    --insecure -o /root/elasticsearch-2.4.0.deb 

RUN apt-get update && apt-get install adduser && \
    dpkg -i /root/elasticsearch-2.4.0.deb && rm /root/elasticsearch-2.4.0.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/elasticsearch/config && \
    cp -a /etc/elasticsearch/* /usr/share/elasticsearch/config && \
    mkdir /usr/share/elasticsearch/logs && \
    mkdir /usr/share/elasticsearch/data && \
    mkdir /usr/share/elasticsearch/config/templates && \
    chown -R elasticsearch.elasticsearch /usr/share/elasticsearch/*

ENV ES_HOME "/usr/share/elasticsearch"
ENV ES_USER "elasticsearch"

WORKDIR /usr/share/elasticsearch

VOLUME ["/usr/share/elasticsearch/data"]

EXPOSE 9200 9300

RUN bin/plugin install delete-by-query
COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY start.sh /usr/share/elasticsearch/start.sh
RUN chmod +x /usr/share/elasticsearch/start.sh

CMD ["/usr/share/elasticsearch/start.sh"]

