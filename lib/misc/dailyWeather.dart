// To parse this JSON data, do
//
//     final dailyWeather = dailyWeatherFromJson(jsonString);

import 'dart:convert';

DailyWeather dailyWeatherFromJson(String str) =>
    DailyWeather.fromJson(json.decode(str));

String dailyWeatherToJson(DailyWeather data) => json.encode(data.toJson());

class DailyWeather {
  DailyWeather({
    this.daily,
  });

  List<Daily>? daily;

  factory DailyWeather.fromJson(Map<String, dynamic> json) => DailyWeather(
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "daily": List<dynamic>.from(daily!.map((x) => x.toJson())),
      };
}

class Daily {
  Daily({
    this.dt,
    this.temp,
    this.humidity,
    this.windSpeed,
    this.weather,
    this.clouds,
    this.rain,
  });

  int? dt;
  Temp? temp;
  int? humidity;
  double? windSpeed;
  List<Weather>? weather;
  int? clouds;
  double? rain;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        temp: Temp.fromJson(json["temp"]),
        humidity: json["humidity"],
        windSpeed: json["wind_speed"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        rain: json["rain"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp?.toJson(),
        "humidity": humidity,
        "wind_speed": windSpeed,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds,
        "rain": rain,
      };
}

class Temp {
  Temp({
    this.day,
    this.night,
  });

  double? day;
  double? night;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"],
        night: json["night"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
      };
}

class Weather {
  Weather({
    this.main,
    this.description,
  });

  String? main;
  String? description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "description": description,
      };
}
