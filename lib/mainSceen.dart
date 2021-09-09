import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/LowerPart/weatherDetails.dart';
import 'package:weather/widgets/UpperPart/weatherCards.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WeatherCard(width: width, height: height * 0.80),
              SizedBox(height: 20.0),
              WeatherDetail(width: width, height: height),
            ],
          ),
        ),
      ),
    );
  }
}
