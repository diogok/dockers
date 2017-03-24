VERSION = 0.7.5

all: build clean

build: server server-arm

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

agent: consul-amd64
	docker build -t diogok/consul:agent -f Dockerfile.agent .

server: agent
	docker build -t diogok/consul:server -f Dockerfile.server .

agent-arm: consul-arm
	docker build -t diogok/consul:agent-arm -f Dockerfile.agent.arm .

server-arm: agent-arm
	docker build -t diogok/consul:server-arm -f Dockerfile.server.arm .

push:
	docker push diogok/consul

clean:
	rm -f consul*
