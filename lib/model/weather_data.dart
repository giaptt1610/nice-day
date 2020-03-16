import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/coordinate.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/main.dart';
import 'package:weather_app/model/wind.dart';
import 'package:weather_app/model/clouds.dart';
import 'package:weather_app/model/sys.dart';

class WeatherData {
  Coordinate coordinate;
  Weather  weather;
  Main      main;
  Wind      wind;
  Clouds    clouds;
  Sys       sys;
  var dt; // Time of data calculation, unix, UTC
  var timeZone; // Shift in seconds from UTC
  var id; // City ID
  var name; // City Name

  WeatherData(Map<String, dynamic> weatherData) {
    coordinate = Coordinate(weatherData['coord']);
    var list = weatherData['weather'];
    if (list.length > 0) {
      weather = Weather(list[0]);
      print('${weather.runtimeType} : $weather');
    }
    main = Main(weatherData['main']);
    wind = Wind(weatherData['wind']);
    clouds = Clouds(weatherData['clouds']);
    sys = Sys(weatherData['sys']);
    dt = weatherData['dt'];
    timeZone = weatherData['timezone'];
    id = weatherData['id'];
    name = weatherData['name'];
  }
}