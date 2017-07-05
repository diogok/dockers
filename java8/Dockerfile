FROM debian:jessie

# Base stuff
RUN apt-get update && \
    apt-get install -y curl unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["java"]

# Java 8
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
RUN echo "deb http://repos.azulsystems.com/debian stable main" >> /etc/apt/sources.list.d/zulu.list
RUN apt-get update && \
    apt-get -y install zulu-8=8.21.0.1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

