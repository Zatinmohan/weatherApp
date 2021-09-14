// To parse this JSON data, do
//
//     final weatherDataCurrent = weatherDataCurrentFromJson(jsonString);

import 'dart:convert';

WeatherDataCurrent weatherDataCurrentFromJson(String str) =>
    WeatherDataCurrent.fromJson(json.decode(str));

String weatherDataCurrentToJson(WeatherDataCurrent data) =>
    json.encode(data.toJson());

class WeatherDataCurrent {
  WeatherDataCurrent({
    this.current,
  });

  Current? current;

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "current": current?.toJson(),
      };
}

class Current {
  Current({
    this.dt,
    this.windSpeed,
    this.humidity,
    this.clouds,
    this.weather,
  });

  int? dt;
  double? windSpeed;
  int? humidity;
  int? clouds;
  List<Weather>? weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        windSpeed: json["wind_speed"].toDouble(),
        humidity: json["humidity"],
        clouds: json["clouds"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "wind_speed": windSpeed,
        "humidity": humidity,
        "clouds": clouds,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
      };
}

class Weather {
  Weather({
    this.description,
  });

  String? description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
