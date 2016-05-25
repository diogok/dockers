FROM debian:jessie

WORKDIR /opt

RUN apt-get update 
RUN apt-get install -y ca-certificates python python-dev python-pip build-essential wget curl unzip git 
RUN apt-get remove -y python-setuptools && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install -U pip setuptools
      
RUN git clone https://github.com/Yelp/elastalert.git

WORKDIR /opt/elastalert

RUN pip install -r requirements.txt 
RUN python setup.py install
RUN mkdir /opt/elastalert/rules

COPY ./run.sh /opt/elastalert/run.sh

CMD ["/opt/elastalert/run.sh"]

COPY ./config.yaml /opt/elastalert/config.yaml
ADD ./rules /opt/elastalert/
