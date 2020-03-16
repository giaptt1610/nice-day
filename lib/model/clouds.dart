class Clouds {
  var all; // Cloudiness, %

  Clouds(Map<String, dynamic> data) {
    all = data['all'];
  }
}