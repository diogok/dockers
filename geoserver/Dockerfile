FROM debian:wheezy

# Base stuff
RUN sed -i -e 's/http.debian.net/ftp.us.debian.org/g' /etc/apt/sources.list && \
    sed -i -e 's/httpredir/ftp.us/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl unzip supervisor wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Java 8
ENV JAVA_HOME /usr/jdk1.8.0_31

RUN curl --insecure --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
      --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
      "https://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz" \
      | gunzip \
      | tar x -C /usr/ \
      && ln -s $JAVA_HOME /usr/java \
      && rm -rf $JAVA_HOME/src.zip $JAVA_HOME/javafx-src.zip $JAVA_HOME/man

ENV PATH ${PATH}:${JAVA_HOME}/bin

# Jetty
RUN wget http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.2.10.v20150310/jetty-runner-9.2.10.v20150310.jar -O /opt/jetty.jar

# Geoserver
RUN curl http://ufpr.dl.sourceforge.net/project/geoserver/GeoServer/2.7.1/geoserver-2.7.1-war.zip -o /tmp/geoserver.zip && \
    cd /tmp && unzip geoserver.zip && \
    mv geoserver.war /opt/geoserver.war
 
# Basic dirs
RUN mkdir /data  
ENV GEOSERVER_DATA_DIR /data

# Basic config
EXPOSE 8080 
VOLUME ["/data"]
CMD ["java","-jar","-server","/opt/jetty.jar","/opt/geoserver.war"]

