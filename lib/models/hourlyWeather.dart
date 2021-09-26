// To parse this JSON data, do
//
//     final hourlyWeather = hourlyWeatherFromJson(jsonString);

// HourlyWeather hourlyWeatherFromJson(String str) =>
//     HourlyWeather.fromJson(json.decode(str));

// String hourlyWeatherToJson(HourlyWeather data) => json.encode(data.toJson());

class HourlyWeather {
  HourlyWeather({
    this.hourly,
  });

  List<Hourly>? hourly;

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
        hourly:
            List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hourly": List<dynamic>.from(hourly!.map((x) => x.toJson())),
      };
}

class Hourly {
  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  int? dt;
  double? temp;
  List<Weather>? weather;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json["dt"],
        temp: json["temp"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
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
