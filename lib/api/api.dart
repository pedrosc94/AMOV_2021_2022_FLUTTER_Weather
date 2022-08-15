// OPEN WEATHER - API

import 'dart:convert';
import 'package:http/http.dart' as http;

const api = "http://api.openweathermap.org/data/2.5/";
const key = "appid=";
const unit = "metric"; // doing nothing for now
const lang = "pt"; // doing nothing for now

Future<Map<String, dynamic>>? getWeatherByName(String cityName) async {
  var url = api + "weather?q=" + cityName + "&units=" + unit + "&" + key;
  print(url);
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}

Future<Map<String, dynamic>>? getWeatherByCoords(var lat, var lon) async {
  var url = api + "weather?" + "lat=" + lat + "&lon=" + lon + "&units=" + unit + "&" + key;
  print(url);
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}

Future<Map<String, dynamic>>? getForecastByCoords(var lat, var lon) async {
  var url = api + "forecast?" + "lat=" + lat + "&lon=" + lon + "&units=" + unit + "&" + key;
  print(url);
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}

/*
Future<Map<String, dynamic>>? getForecastByName(String cityName) async {
  var url = api + "forecast?" + cityName + "&" + key;
  print(url);
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}
*/
