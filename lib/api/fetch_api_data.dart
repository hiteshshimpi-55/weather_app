import 'dart:convert';

import 'package:weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_hourly.dart';
import 'package:weather_app/model/weather_data_daily.dart';

import 'api_key.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the data

  Future<WeatherData> processData(lat, lon) async {
    //fetching data from api
    var response = await http.get(Uri.parse(getUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}

String getUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apikey&units=metric";
  return url;
}
