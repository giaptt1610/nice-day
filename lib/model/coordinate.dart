class Coordinate {
  var lon;
  var lat;

  Coordinate(Map<String, dynamic> data) {
    lon = data['lon'];
    lat = data['lat'];
  }
}