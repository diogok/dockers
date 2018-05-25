#!/bin/sh

ngrok authtoken $NGROK_AUTH 

ngrok $NGROK_SERVICE $NGROK_PORT &
PID=$!
sleep 10
curl -s localhost:4040/api/tunnels | grep '"public_url":"\([^"]\+\)"' -o

wait $!
