import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charcode/charcode.dart';
import 'package:weather_app/model/coordinate.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:weather_app/daily_forecast.dart';
import 'package:weather_app/hourly_forecast.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/api/open_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App', // this is App title
      home: WeatherLayoutWidget()
    );
  }
}

class WeatherLayoutWidget extends StatefulWidget {


  @override
  _WeatherLayoutWidgetState createState() {
    // TODO: implement createState
    return _WeatherLayoutWidgetState();
  }

}

class _WeatherLayoutWidgetState extends State<WeatherLayoutWidget> {
  OpenWeatherMap api = OpenWeatherMap();

  Text _currentTemp = Text('-', style: TextStyle(fontSize: 80, color: Colors.white));
  final Text _degSymbol = Text(String.fromCharCode($deg), style: TextStyle(fontSize: 40, color: Colors.white));
  Text _maxTemp = Text('18' + String.fromCharCode($deg), style: TextStyle(fontSize: 20, color: Colors.white));
  final Text _forwardSlash = Text('/', style: TextStyle(fontSize: 20, color: Colors.white));
  Text _minTemp = Text('16' + String.fromCharCode($deg), style: TextStyle(fontSize: 16, color: Colors.white));

  Text _status = Text('Cloudy', style: TextStyle(fontSize: 24, color: Colors.white));
  Text _location = Text('Hanoi', style: TextStyle(fontSize: 20, color: Colors.white));
  final Text _lastUpdate = Text('Last updated: ', style: TextStyle(fontSize: 10, color: Colors.white));
  Text _lastUpdateTime = Text('00:19', style: TextStyle(fontSize: 10, color: Colors.white));
  AdditionalInfo additionalInfo = AdditionalInfo('89', '5 m/s', 'West', '10', '06:06', '18:06');

  DailyForecastWidget tomorrow = DailyForecastWidget('Tomorrow, 16 Mar', '', '23', '20');
  DailyForecastWidget day2 = DailyForecastWidget('Tue, 17 Mar', '', '23', '20');
  DailyForecastWidget day3 = DailyForecastWidget('Wed, 18 Mar', '', '23', '20');
  DailyForecastWidget day4 = DailyForecastWidget('Thu, 19 Mar', '', '23', '20');
  DailyForecastWidget day5 = DailyForecastWidget('Fri, 20 Mar', '', '23', '20');
  DailyForecastWidget day6 = DailyForecastWidget('Sat, 21 Mar', '', '23', '20');

  HourlyForecastWidget nextHour1 = HourlyForecastWidget('01:00', '', '25');
  HourlyForecastWidget nextHour2 = HourlyForecastWidget('02:00', '', '23');
  HourlyForecastWidget nextHour3 = HourlyForecastWidget('03:00', '', '21');
  HourlyForecastWidget nextHour4 = HourlyForecastWidget('04:00', '', '20');
  HourlyForecastWidget nextHour5 = HourlyForecastWidget('05:00', '', '24');

  void _testUpdate() {

  }

  /// return a String formatted 'HH:mm'
  String _getTime(DateTime time) {
    var hour = time.hour;
    var min = time.minute;
    var hh, mm;
    if (hour < 10) {
      hh = '0$hour';
    } else { hh = '$hour';}

    if (min < 10) {
      mm = '0$min';
    } else { mm = '$min';}

    return '$hh:$mm';
  }
  
  void _updateUI(WeatherData newData) {
    _currentTemp = Text('${newData.main.temp}', style: TextStyle(fontSize: 80, color: Colors.white));
    _maxTemp = Text('${newData.main.tempMax}' + String.fromCharCode($deg), style: TextStyle(fontSize: 20, color: Colors.white));
    _minTemp = Text('${newData.main.tempMin}' + String.fromCharCode($deg), style: TextStyle(fontSize: 16, color: Colors.white));
    _status = Text('${newData.weather.main}', style: TextStyle(fontSize: 24, color: Colors.white));
    _location = Text('${newData.name}', style: TextStyle(fontSize: 20, color: Colors.white));
    
    var time = DateTime.fromMillisecondsSinceEpoch(newData.dt * 1000);
    print('$time');
    _lastUpdateTime = Text('${_getTime(time)}', style: TextStyle(fontSize: 10, color: Colors.white));
    var sunRise = DateTime.fromMillisecondsSinceEpoch(newData.sys.sunRise * 1000);
    var sunSet = DateTime.fromMillisecondsSinceEpoch(newData.sys.sunSet * 1000);
    additionalInfo = AdditionalInfo('${newData.main.humidity}', '${newData.wind.speed} m/s', 'West', '10', '${_getTime(sunRise)}', '${_getTime(sunSet)}');
  }

  void _getWeatherData() async {
    var cityId = 1581130;
    api.cityId = cityId;
    Future<WeatherData> future = api.getCurrentWeatherData(cityId);
    future.then((WeatherData data) {
      setState(() {
        _updateUI(data);
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('My Weather App'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_vert), onPressed: () { _testUpdate();}),

          ],
        ),
        body: RefreshIndicator(
          child: _buildBody(),
          onRefresh: _handleOnRefresh,
        )

    );
  }

  Widget _buildBody() {
    return Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: _currentTemp,
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.only(top: 0),
                    ),
                    Container(
                      child: _degSymbol,
                      padding: const EdgeInsets.only(top: 10),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _maxTemp,
                  _forwardSlash,
                  _minTemp
                ],
              ),
              Container(
                child: Center(
                  child: _status,
                ),
                margin: const EdgeInsets.only(bottom: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: _location,
                      margin: const EdgeInsets.only(left: 20, right: 5),
                    ),
                    Icon(Icons.location_on, color: Colors.white)
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _lastUpdate,
                    _lastUpdateTime
                  ],
                ),
              ),

              // forecast hourly
              Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 60,
                          child: nextHour1
                      ),
                      Container(
                          width: 60,
                          child: nextHour2
                      ),
                      Container(
                          width: 60,
                          child: nextHour3
                      ),
                      Container(
                          width: 60,
                          child: nextHour4
                      ),
                      Container(
                          width: 60,
                          child: nextHour5
                      ),
                    ],
                  )
              ),

              // forecast the next 5 days.
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: tomorrow
              ),

              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: day2,
              ),

              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: day3,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: day4,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: day5,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: day6,
              ),

              // additional info
              Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: additionalInfo
              ),

            ], // column layout
          ),
        )
    );
  }

  Future<Null> _handleOnRefresh() async {
    _getWeatherData();

    return null;
  }
}
