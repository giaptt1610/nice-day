class Sys {
  var type; // Internal parameter
  var id; // Internal parameter
  var country; // Country code (GB, JP etc.)
  var sunRise; // Sunrise time, unix, UTC
  var sunSet; // Sunset time, unix, UTC

  Sys(Map<String, dynamic> data) {
    type = data['type'];
    id = data['id'];
    country = data['country'];
    sunRise = data['sunrise'];
    sunSet = data['sunset'];
  }
}