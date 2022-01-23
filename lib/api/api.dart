// OPEN WEATHER - API KEY: 3b09cbb2ef231ade475e05cffd7d018b
//
// Current -> &weather
// Forecast 5 Day / 3 Hour -> &forecast
//
// http://api.openweathermap.org/data/2.5/weather?q={city name}&appid=3b09cbb2ef231ade475e05cffd7d018b
// http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=3b09cbb2ef231ade475e05cffd7d018b
//
import 'dart:convert';
import 'package:http/http.dart' as http;

const api = "http://api.openweathermap.org/data/2.5/";
const key = "appid=3b09cbb2ef231ade475e05cffd7d018b";
const unit = "metric"; // doing nothing for now
const lang = "pt"; // doing nothing for now

Future<Map<String, dynamic>>? getWeatherByName(String cityName) async {
  var url = api + "weather?q=" + cityName + "&" + key;
  print(url);

  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}

Future<Map<String, dynamic>>? getWeatherByCoords(var lat, var lon) async {
  var url = api + "weather?" + lat + "&" + lon + "&" + key;
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}

Future<Map<String, dynamic>>? getForecastByCoords(var lat, var lon) async {
  var url = api + "forecast?" + lat + "&" + lon + "&" + key;
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}

/*
Future<Map<String, dynamic>>? getForecastByName(String cityName) async {
  var url = api + "forecast?" + cityName + "&" + key;
  var urlResult = await http.get(Uri.parse(url));

  Map<String, dynamic> result = jsonDecode(urlResult.body);
  return result;
}
*/
