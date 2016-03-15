FROM debian:jessie

# Base stuff
RUN apt-get update && \
    apt-get install -y curl unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["java"]

# Java 8
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
RUN echo "deb http://repos.azulsystems.com/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list.d/zulu.list
RUN apt-get -qq update && \
    apt-get -qqy install zulu-8=8.13.0.5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

