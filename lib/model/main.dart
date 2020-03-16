class Main {
  var temp;
  var feelsLike;
  var humidity;
  var tempMin;
  var tempMax;

  Main(Map<String, dynamic> data) {
    temp = data['temp'];
    feelsLike = data['feels_like'];
    humidity = data['humidity'];
    tempMin = data['temp_min'];
    tempMax = data['temp_max'];
  }
}