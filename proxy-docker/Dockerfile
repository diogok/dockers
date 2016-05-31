FROM debian:jessie

RUN sed -i -e 's/http.debian.net/ftp.us.debian.org/g' /etc/apt/sources.list && \
    sed -i -e 's/httpredir/ftp.us/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y ruby procps curl nginx supervisor && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-1.9.0 -o /usr/bin/docker && chmod +x /usr/bin/docker

RUN mkdir /var/log/supervisord 
RUN echo 'daemon off ;' >> /etc/nginx/nginx.conf

EXPOSE 80

CMD [ "supervisord" ]

ADD nginxconf.rb /usr/bin/nginxconf

RUN chmod 755 /usr/bin/nginxconf

ADD nginx.conf.erb /etc/nginx/nginx.conf.erb
ADD supervisord.conf /etc/supervisor/conf.d/proxy.conf

