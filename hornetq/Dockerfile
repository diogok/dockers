FROM diogok/java8

WORKDIR /opt

RUN wget http://downloads.jboss.org/hornetq/hornetq-2.4.0.Final-bin.tar.gz && \
    tar -xvf hornetq-2.4.0.Final-bin.tar.gz && \
    mv hornetq-2.4.0.Final hornetq && \
    rm hornetq-2.4.0.Final-bin.tar.gz

WORKDIR /opt/hornetq/bin

EXPOSE 5445 5446 5455 61613 61614 61614

CMD ["./run.sh"]

