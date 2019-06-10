
VERSION=0.0.4
OUT=stdout

build-all:
	make build OUT=es
	make build OUT=stdout
	make build OUT=loki

build:
	docker build -f Dockerfile.$(OUT) -t diogok/fluentbit:$(VERSION)-$(OUT)
