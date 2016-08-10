FROM diogok/java8:zulu

WORKDIR /opt
RUN mkdir -p /var/data/ipt

RUN curl https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.3.9.v20160517/jetty-runner-9.3.9.v20160517.jar -o /opt/jetty.jar

RUN curl http://repository.gbif.org/content/groups/gbif/org/gbif/ipt/2.3/ipt-2.3.war -o /opt/ipt.war
RUN unzip ipt.war -d /opt/ipt
RUN echo "/var/data/ipt" > /opt/ipt/WEB-INF/datadir.location

CMD ["java","-server","-jar","/opt/jetty.jar","--port","80","--path","/","/opt/ipt"]
