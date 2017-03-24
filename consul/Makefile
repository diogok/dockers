VERSION = 0.7.5

all: build clean

build: amd64-server arm-server

consul-arm:
	wget https://releases.hashicorp.com/consul/$(VERSION)/consul_$(VERSION)_linux_arm.zip -O consul.zip
	unzip consul.zip
	mv consul consul-arm
	rm consul.zip

consul-amd64:
	wget https://releases.hashicorp.com/consul/$(VERSION)/consul_$(VERSION)_linux_amd64.zip -O consul.zip
	unzip consul.zip
	mv consul consul-amd64
	rm consul.zip

amd64-agent: consul-amd64
	docker build -t diogok/consul:agent -f Dockerfile.agent .

amd64-server: amd64-agent
	docker build -t diogok/consul:server -f Dockerfile.server .

arm-agent: consul-arm
	docker build -t diogok/consul:arm-agent -f Dockerfile.agent.arm .

arm-server: arm-agent
	docker build -t diogok/consul:arm-server -f Dockerfile.server.arm .

push:
	docker push diogok/consul

clean:
	rm -f consul*
