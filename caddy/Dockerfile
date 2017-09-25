FROM debian:stretch

RUN apt-get update && apt-get install -yq tar curl git gettext-base

RUN curl "https://github.com/mholt/caddy/releases/download/v0.10.9/caddy_v0.10.9_linux_amd64.tar.gz" -L -o caddy.tar.gz && \
    tar --no-same-owner -C /usr/bin/ -xf caddy.tar.gz && rm caddy.tar.gz

EXPOSE 80
EXPOSE 443

CMD ["caddy", "--conf", "/etc/Caddyfile"]

COPY Caddyfile /etc/Caddyfile

