VERSION = 0.8.1

all: build clean

build: amd64 arm

serf-arm:
	wget https://releases.hashicorp.com/serf/$(VERSION)/serf_$(VERSION)_linux_arm.zip -O serf.zip
	unzip serf.zip
	mv serf serf-arm
	rm serf.zip

serf-amd64:
	wget https://releases.hashicorp.com/serf/$(VERSION)/serf_$(VERSION)_linux_amd64.zip -O serf.zip
	unzip serf.zip
	mv serf serf-amd64
	rm serf.zip

amd64: serf-amd64
	docker build -t diogok/serf .

arm: serf-arm
	docker build -t diogok/serf:arm -f Dockerfile.arm .

push:
	docker push diogok/serf

clean:
	rm -f serf*
