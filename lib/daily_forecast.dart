import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:charcode/charcode.dart';


class DailyForecastWidget extends StatelessWidget {
  final String _day;
  final String _icon;
  final String _maxTemp;
  final String _minTemp;

  DailyForecastWidget(this._day, this._icon, this._maxTemp, this._minTemp);

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
    Icon _weatherIcon = _getIcon();
    Text _textMax = Text(_maxTemp + String.fromCharCode($deg), style: TextStyle(color: Colors.white));
    Text _textMin = Text(_minTemp + String.fromCharCode($deg), style: TextStyle(color: Colors.white));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(_day, style: TextStyle(fontSize: 16, color: Colors.white)),
            padding: const EdgeInsets.only(left: 5),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            child: _weatherIcon,
            padding: const EdgeInsets.only(bottom: 8),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _textMax,
                  Text(' / ', style: TextStyle(color: Colors.white)),
                  _textMin
                ],
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          flex: 2,
        ),
      ],
    );
  }

}

