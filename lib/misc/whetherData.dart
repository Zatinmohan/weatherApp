class WeatherData {
  final int temp;
  final String location;
  final int wind;
  final int rain;

  WeatherData({
    required this.temp,
    required this.location,
    required this.wind,
    required this.rain,
  });
}

List<WeatherData> weather = [
  WeatherData(temp: 28, location: "location", wind: 29, rain: 4),
  WeatherData(temp: 28, location: "location", wind: 29, rain: 4),
  WeatherData(temp: 28, location: "location", wind: 29, rain: 4),
  WeatherData(temp: 28, location: "location", wind: 29, rain: 4),
];
