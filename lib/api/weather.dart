import 'dart:convert';

import 'package:weather/misc/apiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/dailyWeather.dart';
import 'package:weather/models/hourlyWeather.dart';
import 'package:weather/models/weatherData.dart';
import 'package:weather/models/weatherDataCurrent.dart';

class APIManager {
  WeatherData? _weatherData;

  Future<WeatherData> processData(var lat, var lon) async {
    var response = await http.get(Uri.parse(getURL(lat, lon)));
    var jsonString = jsonDecode(response.body);

    _weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        DailyWeather.fromJson(jsonString), HourlyWeather.fromJson(jsonString));

    return _weatherData!;
  }
}
