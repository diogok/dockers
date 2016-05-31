# proxy-docker

This container is an nginx proxy for running docker containers.

## How it works

- Your run your web apps on docker containers, with names and ports
- Proxy-docker container watches docker for these apps and proxy their names to their proper ports

## Usage

Assuming you are runing at server 192.168.50.25, whenever you see that as HOST.

Run a few webapps:

    $ docker run -d -P --name elasticsearch -t dockerfile/elasticsearch
    $ docker run -d -P --name blog -t tutum/wordpress

And finally start the proxy:

    $ docker run -d -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock:r -e ROOT_APP=blog --name proxy -t diogok/proxy-docker

And this proxy will be set:

    http://192.168.50.25/
    http://192.168.50.25/elasticsearch
    http://192.168.50.25/blog
    http://192.168.50.25/proxy 

At any change on running containers the proxy will pick it up.

## TODO

- subdomains

## License 

MIT

