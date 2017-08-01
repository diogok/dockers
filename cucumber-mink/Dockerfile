FROM node:8

RUN npm install -g cucumber 
RUN npm install -g cucumber-mink

WORKDIR /opt

CMD ["cucumber-mink","--port","4444","--server","selenium","--browser","firefox","-r","/opt/acceptance"]

