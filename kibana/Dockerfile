FROM debian:jessie

RUN sed -i -e 's/http.debian.net/ftp.us.debian.org/g' /etc/apt/sources.list && \
    sed -i -e 's/httpredir/ftp.us/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -qy curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

RUN cd /opt && \
    curl -L 'https://download.elastic.co/kibana/kibana/kibana-4.3.1-linux-x64.tar.gz' -o kibana.tar.gz && \
    tar -xvf kibana.tar.gz && \
    mv kibana-4.3.1-linux-x64 kibana && \
    rm kibana.tar.gz

WORKDIR /opt/kibana

CMD ["/opt/start.sh"]
COPY kibana.yml /opt/kibana/config/kibana.yml
COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

