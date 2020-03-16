import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:weather_app/model/weather_data.dart';

class OpenWeatherMap {
  final apiKey = '838ceb1b75a3e896bf176e0c84f15b5c';
  final baseUrl = 'http://api.openweathermap.org/data/2.5/';
  final type = 'weather';

  int _cityId;
  double _longitude;
  double _latitude;

  OpenWeatherMap() {
    this._cityId = 0;
    this._longitude = 0;
    this._latitude = 0;
  }

  //void set city
  String _buildUrlByCityId() {
    return '$baseUrl$type?id=$_cityId&APPID=$apiKey&units=metric';
  }

  String _buildUrlByGps() {
    return '$baseUrl$type?lat=$_latitude&lon=$_longitude&APPID=$apiKey&units=metric';
  }

  set cityId(int id) {
    this._cityId = id;
  }

  set longitude(double lon) {
    this._longitude = lon;
  }

  set latitude(double lat) {
    this._latitude = lat;
  }

  Future<WeatherData> getCurrentWeatherData(var cityId) async{
    this._cityId = cityId;
    var url = _buildUrlByCityId();
    print('url: $url');
    WeatherData weatherData;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonRes = convert.jsonDecode(response.body);
      weatherData = WeatherData(jsonRes);
    }

    return Future.value(weatherData);
  }


}