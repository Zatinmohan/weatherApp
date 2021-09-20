import 'package:weather/misc/dailyWeather.dart';
import 'package:weather/misc/hourlyWeather.dart';
import 'package:weather/misc/weatherDataCurrent.dart';

class weatherData {
  WeatherDataCurrent? _current;
  DailyWeather? _daily;
  HourlyWeather? _hourly;
  weatherData([
    this._current,
    this._daily,
    this._hourly,
  ]);

  WeatherDataCurrent getCurrentData() => _current!;

  DailyWeather getDailyWeather() => _daily!;

  HourlyWeather getHourlyWeather() => _hourly!;
}
