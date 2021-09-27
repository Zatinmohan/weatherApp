import 'package:weather/api/api_key.dart';

final Url = "https://api.openweathermap.org/data/2.5/onecall?";
final Lat = "lat=";
final Lon = "&lon=";
final Units = "&units=metric";
final exclude = "&exclue=minutely";
final appid = "&appid=";

const String instagram = "https://www.instagram.com/o.my.god.someone_actually/";
const String github = "https://github.com/Zatinmohan";
const String email = "jatinmohan06@gmail.com";
const String linkedIn = "https://www.linkedin.com/in/jatin-mohan/";

String getURL(var lat, var lon) {
  String _url;
  _url = Url +
      Lat +
      lat.toString() +
      Lon +
      lon.toString() +
      Units +
      exclude +
      appid +
      key;
  return _url;
}
