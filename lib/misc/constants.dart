import 'package:flutter/material.dart';
import 'package:weather/api/api_key.dart';

final cardColor = Color(0xff4884EE);
final nextCardColor = Color(0xff06BCFB);
final cardBorderGlow = Color(0xff1FD1F9);
final backgroundColor = Color(0xff171717);
final cardBorder = Color(0xff2B2B2B);
const textColor = Color(0xfffdfcfa);
const secondaryTextColor = Color(0xff808080);
const secondaryTextColor2 = Color(0xffdbdbdb);

//------- Height and Width-----
extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

//------------------Setting optins---------------------
List<String> settingOptions = ["About", "Settings"];

//------API URL----------------
final Url = "https://api.openweathermap.org/data/2.5/onecall?";
final Lat = "lat=";
final Lon = "&lon=";
final Units = "&units=metric";
final exclude = "&exclue=minutely";
final appid = "&appid=";
final degree = "°";
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

//-------------------- Icons For Weather---------------------------------
//Thunderstorm
const thunderStorm = "assets/clouds/ThunderStorm.png";
const thunderStormWithClouds = "assets/clouds/ThunderstormWithRain.png";
const heavyThunderStorm = "assets/clouds/HeavyThunderStorm.png";

//Rain
const lightRain = "assets/clouds/LightRain.png";
const moderateRain = "assets/clouds/ModerateRain.png";
const lightRainSnow = "assets/clouds/LightRainSnow.png";

//Clouds
const HeavycloudyDay = "assets/clouds/Cloudy.png";

//Clear Day
const clear = "assets/sun/Clear.png";
const cloudyDay = "assets/sun/Cloudy.png";

//Snow
const snow = "assets/snow/Snow.png";

//Mist
const mist = "assets/sun/Misty.png";

//---------------------------------------------------------------

//--------------------Icon Selector------------------------------
String selectIcon(String w) {
  //Thunderstorm
  if (w == "thunderstorm with light rain" ||
      w == "thunderstorm with rain" ||
      w == "ragged thunderstorm" ||
      w == "thunderstorm with light drizzle" ||
      w == "thunderstorm with drizzle")
    return thunderStormWithClouds;
  else if (w == "thunderstorm with heavy rain" ||
      w == "heavy thunderstorm" ||
      w == "thunderstorm with heavy drizzle")
    return heavyThunderStorm;
  else if (w == "light thunderstorm" ||
      w == "thunderstorm" ||
      w == "very heavy rain" ||
      w == "extreme rain")
    return thunderStorm;

  //Drizzle and Rain
  else if (w == "light intensity drizzle" ||
      w == "drizzle" ||
      w == "light intensity drizzle rain" ||
      w == "shower rain and drizzle" ||
      w == "shower drizzle" ||
      w == "light rain" ||
      w == "shower rain")
    return lightRain;
  else if (w == "heavy intensity drizzle" ||
      w == "heavy shower rain and drizzle" ||
      w == "moderate rain" ||
      w == "heavy intensity rain" ||
      w == "light intensity shower rain" ||
      w == "heavy intensity shower rain" ||
      w == "ragged shower rain")
    return moderateRain;
  else if (w == "freezing rain")
    return lightRainSnow;
  else if (w == "mist" ||
      w == "Smoke" ||
      w == "Haze" ||
      w == "sand/ dust whirls" ||
      w == "fog" ||
      w == "sand" ||
      w == "dust" ||
      w == "volcanic ash" ||
      w == "squalls" ||
      w == "tornado")
    return mist;
  else if (w == "clear sky")
    return clear;
  else if (w == "broken clouds")
    return HeavycloudyDay;
  else
    return snow;
}
//-----------------------------------------------------------------------

//---------------------Styles--------------------------------------------
//Text Styles
const DaysTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: textColor,
);

const SecondaryTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: secondaryTextColor,
);

const smallCardPrimaryText = TextStyle(
  fontWeight: FontWeight.bold,
  color: textColor,
);
