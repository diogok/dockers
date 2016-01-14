#!/bin/bash

[[ "$BASE" != "" ]] && echo server.basePath: /$BASE >> /opt/kibana/config/kibana.yml

/opt/kibana/bin/kibana

