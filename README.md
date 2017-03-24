# Docker 

My containers Dockerfiles 

## Caddy

The auto ssl webserver with default config.

For amd64 and arm (including Raspberry Pi and Pi Zero)

- diogok/caddy
- diogok/caddy:arm

Bind on 80 and 443, config at /etc/Caddyfile.

### ElasticSearch 

Version 5.2.2.

With some config, for amd64, arm (raspberry pi and raspberry pi zero) with optimized zulu java.

- diogok/elasticsearch
- diogok/elasticsearch:rpi
- diogok/elasticsearch:rpi0 (very slow still...)

Bind on 9200 and 9300, auto cluster and volume at /usr/share/elasticsearch/data.

    docker run -p 9200:9200 -v /var/data/elasticsearch:/usr/share/elasticsearch/data diogok/elasticsearch

### Kibana

Ready to connect on above ES.

- diogok/kibana

Bind on 8001.

### Grayalert

Gralylog with Alerting system, see the docker-compose.yml on the grayalert folder.

Bind on 9001, syslog udp input on 9514.

### Hornetq

The Message queue from JBoss.

### Java8

Many editions:

- diogok/java8 (zulu)
- diogok/java8:arm (zulu optimized for arm and raspberry pi zero)

### IPT

GBIF Integrated Publishing Toolkit for biodiversity datasets.

- diogok/ipt

### SMTP

Dummy smtp server

- diogok/smtp

### Serf

Cluster and event server:

- diogok/serf
- diogok/serf:arm

### PHP7

NGINX with PHP7, volume on /var/www.

- diogok/php7
- diogok/php7:arm

Example:

    docker run -v/var/www:/var/www -p80:80 diogok/php7

### Consul

- diogok/consul:agent
- diogok/consul:server (will bootstrap)
- diogok/consul:agent-arm
- diogok/consul:server-arm (will bootstrap)

To join a cluster:

    docker run diogok/consul:server -join ip
