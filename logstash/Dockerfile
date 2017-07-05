FROM docker.elastic.co/logstash/logstash:5.4.2

VOLUME /usr/share/logstash/config/

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-range
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-alter

