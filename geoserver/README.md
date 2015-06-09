# GeoBox

A single box container for the best of Geospatial opensource engines and data managment.

- [GeoServer](http://geoserver.org/)
- [GeoNetwork](http://geonetwork-opensource.org/)
- GeoServices
- GeoManager
- GeoViz

## Usage

With [docker](http://docker.io):

  $ docker run -d -p 8080:8080 -p 9990:9990 -v /var/lib/geobox:/var/lib/geobox:rw -t diogok/geobox 

You will get the index at http://localhost:8080 and the server admin panel at http://localhost:9990.

## License

MIT

