#!/bin/bash

chown elasticsearch.elasticsearch $ES_HOME -R
su -p -s /bin/bash -c './bin/elasticsearch' elasticsearch
