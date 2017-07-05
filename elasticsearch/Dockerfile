FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.2

EXPOSE 9200 9300
VOLUME ["/usr/share/elasticsearch/data"]

ENV ES_JAVA_OPTS "-Xms2g -Xmx2g"
ENV http.host "0.0.0.0"
ENV bootstrap.memory_lock "false"

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

