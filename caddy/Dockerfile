FROM alpine:edge

RUN apk --no-cache add tini git && apk --no-cache add --virtual devs tar curl

RUN curl "https://caddyserver.com/download/build?os=linux&arch=amd64&v=0.9.1&features=" \
      | tar --no-same-owner -C /usr/bin/ -xz caddy

ENTRYPOINT ["tini"]

CMD ["caddy", "--conf", "/etc/Caddyfile"]

