# Apache

Public is /var/www/html.

## Run Solo on a folder


  $ docker run -d --name apache -p 80:80 -v /var/www:/var/www:rw diogok/apache


## Usage as baseimage

  FROM diogok/apache

  ADD . /var/www
  RUN chown www-data.www-data /var/www -Rf

