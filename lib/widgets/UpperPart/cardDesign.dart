import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/UpperPart/cardDetails.dart';

class CardDesign extends StatelessWidget {
  final height,
      width,
      temp,
      mainName,
      weatherDesp,
      wind,
      humidity,
      rain,
      index,
      day;
  const CardDesign({
    Key? key,
    this.day,
    this.index,
    this.height,
    this.width,
    this.temp,
    this.mainName,
    this.weatherDesp,
    this.wind,
    this.humidity,
    this.rain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height + 10,
      decoration: BoxDecoration(
        border: Border.all(color: cardBorder, width: 0.6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70.0),
          bottomRight: Radius.circular(70.0),
        ),
        boxShadow: [
          BoxShadow(
            color: cardBorderGlow.withAlpha(50),
            blurRadius: 8.0,
            spreadRadius: 5.0,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cardColor,
            nextCardColor,
          ],
        ),
      ),
      child: CardDetails(
        width: width,
        height: height,
        temp: temp,
        day: day,
        weatherDesp: weatherDesp,
        weatherName: mainName,
        wind: wind,
        humidity: humidity,
        rain: rain,
      ),
    );
  }
}
