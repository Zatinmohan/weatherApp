import 'package:flutter/material.dart';
import 'package:weather/misc/weatherDataCurrent.dart';
import 'package:weather/widgets/UpperPart/cardDesign.dart';

class DetailWeather extends StatelessWidget {
  final Current? currentWeather;
  final width, height;
  const DetailWeather({Key? key, this.currentWeather, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                CardDesign(
                  width: width,
                  height: height * 0.5,
                  index: 0,
                  temp: currentWeather?.temp,
                  weatherDesp: currentWeather?.weather![0].description,
                  mainName: "N/A",
                  day: currentWeather?.dt,
                  wind: currentWeather?.windSpeed,
                  rain: currentWeather?.clouds,
                  humidity: currentWeather?.humidity,
                  isDetailpage: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
