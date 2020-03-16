import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class AdditionalInfo extends StatelessWidget{
  final String _humidity;
  final String _windSpeed; // m/s
  final String _windDirection;
  final String _uvIndex;
  final String _sunRise;
  final String _sunSet;

  AdditionalInfo(this._humidity, this._windSpeed, this._windDirection, this._uvIndex, this._sunRise, this._sunSet);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(WeatherIcons.humidity, color: Colors.white),
              Container(
                child: Text(_humidity, style: TextStyle(fontSize: 16, color: Colors.white)),
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(WeatherIcons.strong_wind, color: Colors.white),
              Container(
                child: Text(_windSpeed, style: TextStyle(fontSize: 16, color: Colors.white)),
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(WeatherIcons.wind_deg_225, color: Colors.white),
              Container(
                child: Text(_windDirection, style: TextStyle(fontSize: 16, color: Colors.white)),
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text('UV', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                margin: const EdgeInsets.only(top: 5),
              ),
              Container(
                child: Text(_uvIndex, style: TextStyle(fontSize: 16, color: Colors.white)),
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(WeatherIcons.sunrise, color: Colors.white),
              Container(
                child: Text(_sunRise, style: TextStyle(fontSize: 16, color: Colors.white)),
                margin: const EdgeInsets.only(top: 10),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(WeatherIcons.sunset, color: Colors.white),
              Container(
                child: Text(_sunSet, style: TextStyle(fontSize: 16, color: Colors.white)),
                margin: const EdgeInsets.only(top: 10),
              )
            ],
          ),
        )
      ],
    );
  }


}