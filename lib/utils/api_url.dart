import '../api/api_key.dart';

String getUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apikey&units=metric";
  return url;
}
