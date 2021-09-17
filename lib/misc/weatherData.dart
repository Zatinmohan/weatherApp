import 'package:weather/misc/dailyWeather.dart';
import 'package:weather/misc/weatherDataCurrent.dart';

class weatherData {
  WeatherDataCurrent? _current;
  DailyWeather? _daily;

  weatherData([
    this._current,
    this._daily,
  ]);

  WeatherDataCurrent getCurrentData() => _current!;
}
