class Wind {
  var speed; // Unit Default: meter/sec, Imperial: miles/hour
  var deg; // wind direction, degree (meteorological)

  Wind(Map<String, dynamic> data) {
    speed = data['speed'];
    deg = data['deg'];
  }
}