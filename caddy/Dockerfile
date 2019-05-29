FROM debian:stretch-slim

RUN apt-get update && apt-get install -yq tar curl git gettext-base

ENV VERSION 1.0.0

RUN curl https://github.com/mholt/caddy/releases/download/v${VERSION}/caddy_v${VERSION}_linux_amd64.tar.gz -L -o caddy.tar.gz && \
    tar --no-same-owner -C /usr/bin/ -xf caddy.tar.gz && rm caddy.tar.gz

EXPOSE 80
EXPOSE 443

CMD ["caddy", "--conf", "/etc/Caddyfile"]

ENV INDEX index.html
ENV ROOT /var/www/html

COPY Caddyfile /etc/Caddyfile

