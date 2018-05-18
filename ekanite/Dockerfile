FROM debian:stretch

RUN apt update && apt-get install -y curl

RUN	curl -L  https://github.com/ekanite/ekanite/releases/download/v1.3.0/ekanited-v1.3.0-linux-amd64.tar.gz -o ekanited-v1.3.0-linux-amd64.tar.gz && \
	tar xvfz ekanited-v1.3.0-linux-amd64.tar.gz && \
	cp ekanited-v1.3.0-linux-amd64/ekanited /ekanited

#FROM scratch
#COPY --from=0 /ekanited /ekanited

VOLUME /data
EXPOSE 8000 5514

CMD ["/ekanited","-datadir","/data", "-queryhttp", "0.0.0.0:8000","-tcp", "0.0.0.0:5514"]

