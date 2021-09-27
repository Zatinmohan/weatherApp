import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/globalController.dart';

import 'package:weather/widgets/LowerPart/weatherDetails.dart';
import 'package:weather/widgets/UpperPart/weatherCards.dart';

class MainScreen extends StatelessWidget {
  final GlobalController weatherController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => weatherController.loadingCheck().isFalse
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    WeatherCard(
                      width: width,
                      height: height * 0.80,
                      dailyWeather:
                          weatherController.getData().getDailyWeather(),
                    ),
                    SizedBox(height: width * 0.08),
                    WeatherDetail(
                      width: width,
                      height: height,
                      hourly: weatherController.getData().getHourlyWeather(),
                      currentWeather:
                          weatherController.getData().getCurrentData(),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      )),
    );
  }
}
