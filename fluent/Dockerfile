FROM fluent/fluent-bit:0.14

CMD ["/fluent-bit/bin/fluent-bit","--config","/fluent-bit/etc/fluent.cfg"]

ADD fluent.cfg /fluent-bit/etc/fluent.cfg

ENV ES_HOST elasticsearch
ENV ES_PORT 9200

ADD es.cfg /fluent-bit/etc/output.cfg

