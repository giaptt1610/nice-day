class Weather {
  var id;
  var main;
  var description;
  var icon;

  Weather(Map<String, dynamic> data) {
    id = data['id'];
    main = data['main'];
    description = data['description'];
    icon = data['icon'];
  }
}