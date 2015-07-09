FROM diogok/java8

RUN curl http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz | tar xz -C /opt 

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# break steps due to memory usage
RUN echo "y" | android update sdk --no-ui --force --filter 1,2
RUN echo "y" | android update sdk --no-ui --force --filter 2,4,5,6,7,8,9,10
RUN echo "y" | android update sdk --no-ui --force --filter 16,17,21,22,23,24

VOLUME /workspace
WORKDIR /wokspace

