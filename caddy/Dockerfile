FROM alpine:edge

RUN apk --no-cache add --virtual devs tar curl git

RUN curl "https://caddyserver.com/download/build?os=linux&arch=amd64&v=0.9.5&features=" \
      | tar --no-same-owner -C /usr/bin/ -xz caddy

EXPOSE 80
EXPOSE 443

CMD ["caddy", "--conf", "/etc/Caddyfile"]

COPY Caddyfile /etc/Caddyfile

