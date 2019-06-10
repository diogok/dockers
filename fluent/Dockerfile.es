FROM fluent/fluent-bit:1.1.6

CMD ["/fluent-bit/bin/fluent-bit","--config","/fluent-bit/etc/fluent.cfg"]

ADD fluent.cfg /fluent-bit/etc/fluent.cfg

ENV ES_HOST elasticsearch
ENV ES_PORT 9200

ADD es.cfg /fluent-bit/etc/output.cfg

