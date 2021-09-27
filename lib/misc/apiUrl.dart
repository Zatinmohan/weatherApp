import 'package:weather/api/api_key.dart';

final _baseUrl = "https://api.openweathermap.org/data/2.5/onecall?";
final _lat = "lat=";
final _lon = "&lon=";
final _units = "&units=metric";
final _exclude = "&exclue=minutely";
final _appid = "&appid=";

const String instagram = "https://www.instagram.com/o.my.god.someone_actually/";
const String github = "https://github.com/Zatinmohan";
const String email = "jatinmohan06@gmail.com";
const String linkedIn = "https://www.linkedin.com/in/jatin-mohan/";

String getURL(var lat, var lon) {
  String _url;
  _url = _baseUrl +
      _lat +
      lat.toString() +
      _lon +
      lon.toString() +
      _units +
      _exclude +
      _appid +
      key;
  return _url;
}
