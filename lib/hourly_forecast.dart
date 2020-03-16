import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:charcode/charcode.dart';

class HourlyForecastWidget extends StatelessWidget {
  final String _time;
  final String _icon;
  final String _temp;

  HourlyForecastWidget(this._time, this._icon, this._temp);
  Icon _getIcon() {
    IconData iconData;
    if (_icon == '01d'){
      // clear sky day
      iconData = WeatherIcons.day_sunny;

    } else if (_icon == '01n') {
      // clear sky night
      iconData = WeatherIcons.night_clear;
    } else if (_icon == '02d') {
      // few clouds
      iconData = WeatherIcons.day_cloudy;
    } else if (_icon == '02n') {
      iconData = WeatherIcons.night_cloudy;
    } else if (_icon == '03d' || _icon == '03n') {
      // scattered clouds
      iconData = WeatherIcons.cloudy;
    } else if (_icon == '04d') {
      // broken clouds
      iconData = WeatherIcons.cloudy_gusts;
    } else if (_icon == '04n') {
      iconData = WeatherIcons.night_cloudy_gusts;
    } else if (_icon == '09d') {
      // shower rain
      iconData = WeatherIcons.day_showers;
    } else if (_icon == '09n') {
      iconData = WeatherIcons.night_showers;
    } else if (_icon == '10d') {
      // rain
      iconData = WeatherIcons.day_rain;
    } else if (_icon == '10n') {
      iconData = WeatherIcons.night_rain;
    } else if (_icon == '11d') {
      iconData = WeatherIcons.day_thunderstorm;
    } else if (_icon == '11n') {
      iconData = WeatherIcons.night_thunderstorm;
    } else if (_icon == '13d') {
      // snow
      iconData = WeatherIcons.day_snow;
    } else if (_icon == '13n') {
      iconData = WeatherIcons.night_snow;
    } else if (_icon == '50d') {
      // mist
      iconData = WeatherIcons.day_fog;
    } else if (_icon == '50n') {
      iconData = WeatherIcons.night_fog;
    } else {
      iconData = WeatherIcons.cloudy;
    }
    return Icon(iconData, color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(_time, style: TextStyle(fontSize: 14, color: Colors.white)),
        _getIcon(),
        Container(
          child: Text(_temp + String.fromCharCode($deg), style: TextStyle(fontSize: 18, color: Colors.white)),
          padding: const EdgeInsets.only(left: 5),
        )
      ],
    );
  }

}