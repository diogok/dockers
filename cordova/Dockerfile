FROM diogok/android

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm -g install cordova

VOLUME /workspace
WORKDIR /wokspace

