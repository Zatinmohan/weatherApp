import 'package:flutter/material.dart';
import 'package:weather/models/hourlyWeather.dart';
import 'package:weather/models/weatherDataCurrent.dart';
import 'package:weather/widgets/LowerPart/DaysDetails.dart';
import 'package:weather/widgets/LowerPart/smallWeatherCards.dart';

class WeatherDetail extends StatelessWidget {
  final height, width;
  final HourlyWeather? hourly;
  final WeatherDataCurrent? currentWeather;

  const WeatherDetail(
      {Key? key, this.height, this.width, this.hourly, this.currentWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.28,
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DaysDetails(
            width: width,
            height: height,
            currentWeather: currentWeather,
          ),
          Expanded(
              child: SmallWeatherCards(
            width: width,
            height: height,
            hourlyData: hourly?.hourly,
          )),
        ],
      ),
    );
  }
}
