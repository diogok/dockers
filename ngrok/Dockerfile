FROM alpine:3.4

RUN apk update && apk add --no-cache --virtual .build-deps wget ca-certificates curl

RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
    && unzip ngrok-stable-linux-amd64.zip \
    && mv ngrok /usr/local/bin/ngrok 

ENV HOME /root
ENV USER root

ENV NGROK_AUTH none
ENV NGROK_SERVICE http
ENV NGROK_PORT 80

ADD start.sh /root/start.sh

CMD ["/root/start.sh"]

