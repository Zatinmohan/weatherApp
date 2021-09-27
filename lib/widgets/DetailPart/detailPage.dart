import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather/controller/globalController.dart';
import 'package:weather/models/dailyWeather.dart';
import 'package:weather/models/weatherDataCurrent.dart';
import 'package:weather/widgets/DetailPart/weatherList.dart';
import 'package:weather/widgets/UpperPart/cardDesign.dart';
import 'package:get/get.dart';

class DetailWeather extends StatelessWidget {
  final Current? currentWeather;
  final GlobalController controller = Get.find();
  final width, height;
  DetailWeather({Key? key, this.currentWeather, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Daily>? daily = controller.getData().getDailyWeather().daily;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Stack(
            children: [
              Column(
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
                  SizedBox(height: 20.0),
                  WeatherList(width: width, height: height, daily: daily),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
