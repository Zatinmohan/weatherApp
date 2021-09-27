//Thunderstorm
const thunderStorm = "assets/clouds/ThunderStorm.png";
const thunderStormNight = "assets/moon/ThunderStrom.png";

const thunderStormWithClouds = "assets/clouds/ThunderstormWithRain.png";

const heavyThunderStorm = "assets/clouds/HeavyThunderStorm.png";
const heavyThunderStormNight = "assets/moon/HeavyThunderStorm.png";

//Rain
const lightRain = "assets/clouds/LightRain.png";
const lightRainNight = "assets/moon/LightRain.png";

const moderateRain = "assets/clouds/ModerateRain.png";
const moderateRainNight = "assets/moon/HeavyRain.png";

const lightRainSnow = "assets/clouds/LightRainSnow.png";

//Clouds
const HeavycloudyDay = "assets/clouds/Cloudy.png";
const HeavycloudNight = "assets/moon/BrokenClouds.png";

//Clear Day
const clear = "assets/sun/Clear.png";
const cloudyDay = "assets/sun/Cloudy.png";
const clearNight = "assets/moon/Clear.png";

//Snow
const snow = "assets/snow/Snow.png";
const snowNight = "assets/moon/Snow.png";

//Mist
const mist = "assets/sun/Misty.png";
const mistNight = "assets/moon/Mist.png";

String selectIcon(String w) {
  int now = DateTime.now().hour.toInt();

  if (now >= 4 && now < 19) {
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
  } else {
    if (w == "thunderstorm with light rain" ||
        w == "thunderstorm with rain" ||
        w == "ragged thunderstorm" ||
        w == "thunderstorm with light drizzle" ||
        w == "thunderstorm with drizzle")
      return thunderStormWithClouds;
    else if (w == "thunderstorm with heavy rain" ||
        w == "heavy thunderstorm" ||
        w == "thunderstorm with heavy drizzle")
      return heavyThunderStormNight;
    else if (w == "light thunderstorm" ||
        w == "thunderstorm" ||
        w == "very heavy rain" ||
        w == "extreme rain")
      return thunderStormNight;

    //Drizzle and Rain
    else if (w == "light intensity drizzle" ||
        w == "drizzle" ||
        w == "light intensity drizzle rain" ||
        w == "shower rain and drizzle" ||
        w == "shower drizzle" ||
        w == "light rain" ||
        w == "shower rain")
      return lightRainNight;
    else if (w == "heavy intensity drizzle" ||
        w == "heavy shower rain and drizzle" ||
        w == "moderate rain" ||
        w == "heavy intensity rain" ||
        w == "light intensity shower rain" ||
        w == "heavy intensity shower rain" ||
        w == "ragged shower rain")
      return moderateRainNight;
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
      return mistNight;
    else if (w == "clear sky")
      return clearNight;
    else if (w == "broken clouds")
      return HeavycloudyDay;
    else
      return snowNight;
  }
}
