FROM scratch

COPY serf-amd64 /serf

EXPOSE 7373 7946

CMD ["/serf","agent","-discover","docker","-iface","eth0"]
