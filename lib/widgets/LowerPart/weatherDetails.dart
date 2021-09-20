import 'package:flutter/material.dart';
import 'package:weather/misc/hourlyWeather.dart';
import 'package:weather/widgets/LowerPart/DaysDetails.dart';
import 'package:weather/widgets/LowerPart/smallWeatherCards.dart';

class WeatherDetail extends StatelessWidget {
  final height, width;
  final HourlyWeather? hourly;
  const WeatherDetail({Key? key, this.height, this.width, this.hourly})
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
          DaysDetails(width: width, height: height),
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
