#!/bin/bash

. config.ini

sleep 5

[[ -z $URL ]] && URL="http://localhost:8500"

cd services
for FILE in $(ls *.json)
do
  curl -X POST "$URL/v1/agent/service/register" -d @$FILE 
done
cd ..

cd checks
for FILE in $(ls *.json)
do
  curl -X POST "$URL/v1/agent/check/register" -d @$FILE 
done
cd ..

PREFIX="v1/kv/consul-alerts/config/notifiers/email"

curl -X DELETE "$URL/$PREFIX?recurse=true"
[[ -n $SMTP_URL ]] && curl -X PUT "$URL/$PREFIX/enabled" -d 'true'
[[ -n $SMTP_URL ]] && curl -X PUT "$URL/$PREFIX/url" -d $SMTP_URL
[[ -n $SMTP_PORT ]] && curl -X PUT "$URL/$PREFIX/port" -d $SMTP_PORT
[[ -n $SMTP_USERNAME ]] && curl -X PUT "$URL/$PREFIX/username" -d $SMTP_USERNAME
[[ -n $SMTP_PASSWORD ]] && curl -X PUT "$URL/$PREFIX/password" -d $SMTP_PASSWORD
[[ -n $SMTP_SENDER ]] && curl -X PUT "$URL/$PREFIX/sender-email" -d $SMTP_SENDER
[[ -n $SMTP_RECEIVERS ]] && curl -X PUT "$URL/$PREFIX/receivers" -d $SMTP_RECEIVERS

PREFIX="v1/kv/consul-alerts/config/notifiers/slack"
[[ -n $SLACK_URL ]] && curl -X PUT "$URL/$PREFIX/enabled" -d 'true'
[[ -n $SLACK_URL ]] && curl -X PUT "$URL/$PREFIX/url" -d $SLACK_URL
[[ -n $SLACK_CHANNEL ]] && curl -X PUT "$URL/$PREFIX/channel" -d $SLACK_CHANNEL

curl -X GET "$URL/$PREFIX?recurse=true"

