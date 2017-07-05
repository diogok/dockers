#!/bin/bash

sed -i -e "s/user/$USER/" /etc/Caddyfile
sed -i -e "s/password/$PASSWORD/" /etc/Caddyfile
cat /etc/Caddyfile
caddy --conf /etc/Caddyfile

