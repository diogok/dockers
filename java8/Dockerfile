FROM debian:jessie

# Base stuff
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Java 8

ENV JAVA_HOME /usr/jdk1.8.0_45

RUN curl --insecure --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
      --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
      "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz" \
      | gunzip \
      | tar x -C /usr/ \
      && ln -s $JAVA_HOME /usr/java \
      && rm -rf $JAVA_HOME/src.zip $JAVA_HOME/javafx-src.zip $JAVA_HOME/man

ENV PATH ${PATH}:${JAVA_HOME}/bin

CMD ["java"]

