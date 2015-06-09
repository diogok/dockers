FROM diogok/java8

ENV LEIN_ROOT true

RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O /usr/bin/lein && chmod 755 /usr/bin/lein && lein

RUN mkdir /project && ln -s /root/.m2 /m2

WORKDIR /project

VOLUME ["/m2","/project"]

EXPOSE 8080
EXPOSE 3000

ENTRYPOINT ["lein"]
CMD ["run"]

