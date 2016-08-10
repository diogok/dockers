#!/bin/bash

java $JAVA_OPTS -jar /opt/jetty.jar --port $PORT --path $CONTEXT /opt/ipt

