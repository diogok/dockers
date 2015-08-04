FROM diogok/java8

# Basic config
RUN mkdir /var/webapps && mkdir /data
EXPOSE 8080
VOLUME ["/data"]
ENV GEOSERVER_DATA_DIR /data

# Jetty
RUN wget http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.2.10.v20150310/jetty-runner-9.2.10.v20150310.jar -O /opt/jetty.jar

# Geoserver
RUN curl 'http://downloads.sourceforge.net/project/geoserver/GeoServer/2.7.2/geoserver-2.7.2-war.zip?r=&ts=1438732238&use_mirror=heanet' -L -o /tmp/geoserver.zip && \
    cd /tmp && unzip geoserver.zip && \
    mv geoserver.war /var/webapps/geoserver.war && \
    rm /tmp/geoserver.zip

# GeoNetwork
RUN curl http://ufpr.dl.sourceforge.net/project/geonetwork/GeoNetwork_opensource/v3.0.1/geonetwork.war -o /var/webapps/geonetwork.war 

# GeoExplorer?

# GeoNode?

# Run it all
CMD ["java","-jar","/opt/jetty.jar","--path","/geonetwork","/var/webapps/geonetwork.war","--path","/geoserver","/var/webapps/geoserver.war"]

