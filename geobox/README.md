# GeoBox

A single box container for the best of Geospatial opensource engines and data managment.

- [GeoServer](http://geoserver.org/)
- [GeoNetwork](http://geonetwork-opensource.org/)

## Usage

With [docker](http://docker.io):

  $ docker run -d -p 8080:8080 -v /var/data:/data:rw -t diogok/geobox 

You will get the index at http://localhost:8080.

## License

MIT

