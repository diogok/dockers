FROM debian:jessie

RUN echo 'deb http://httpredir.debian.org/debian/ jessie main contrib' > /etc/apt/sources.list.d/contrib.list &&  \
    apt-get update && \
    apt-get install -y curl unzip wget java-package libgl1-mesa-glx libgtk2.0-0 libxslt1.1 libxtst6 libxxf86vm1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["java"]

RUN curl --insecure --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
      --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
      "http://download.oracle.com/otn-pub/java/jdk/8u65-b14/jdk-8u65-linux-x64.tar.gz" \ 
      -o /tmp/jdk-8u65-linux-x64.tar.gz  && \
    adduser --quiet --home /tmp --no-create-home --disabled-password --shell /bin/bash -gecos 'Build' builder && \
    cd /tmp && \
    su builder -c 'yes | fakeroot make-jpkg jdk-8u65-linux-x64.tar.gz' && \
    dpkg -i /tmp/oracle-java8-jdk_8u65_amd64.deb && \
    rm /tmp/oracle-java8-jdk_8u65_amd64.deb && \
    rm /tmp/jdk-8u65-linux-x64.tar.gz

