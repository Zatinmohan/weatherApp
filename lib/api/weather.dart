import 'dart:convert';

import 'package:weather/misc/constants.dart';

import 'package:http/http.dart' as http;
import 'package:weather/misc/dailyWeather.dart';
import 'package:weather/misc/weatherData.dart';
import 'package:weather/misc/weatherDataCurrent.dart';

class APIManager {
  weatherData? _weatherData;

  Future<weatherData> processData(var lat, var lon) async {
    var response = await http.get(Uri.parse(getURL(lat, lon)));
    var jsonString = jsonDecode(response.body);

    _weatherData = weatherData(WeatherDataCurrent.fromJson(jsonString),
        DailyWeather.fromJson(jsonString));

    return _weatherData!;
  }
}
