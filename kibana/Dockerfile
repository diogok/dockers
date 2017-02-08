FROM debian:jessie

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8001

RUN cd /opt && \
    curl -L 'https://artifacts.elastic.co/downloads/kibana/kibana-5.1.2-linux-x86_64.tar.gz' -o kibana.tar.gz && \
    tar -xvf kibana.tar.gz && \
    mv kibana-5.1.2-linux-x86_64 kibana && \
    rm kibana.tar.gz

WORKDIR /opt/kibana

CMD ["/opt/start.sh"]
COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
COPY kibana.yml /opt/kibana/config/kibana.yml

