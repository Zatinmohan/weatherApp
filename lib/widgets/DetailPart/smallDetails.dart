import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/widgets/UpperPart/smallDetails.dart';

class SmallAnotherDetails extends StatelessWidget {
  final height, width, humidity, rain, wind;
  const SmallAnotherDetails(
      {Key? key, this.height, this.width, this.humidity, this.rain, this.wind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SmallDetails(
              width: width,
              height: height,
              value: "$wind km/hr",
              wicon: FontAwesomeIcons.wind,
              measure: "Wind"),
          SmallDetails(
              width: width,
              height: height,
              value: "$humidity %",
              wicon: FontAwesomeIcons.tint,
              measure: "Humidity"),
          SmallDetails(
              width: width,
              height: height,
              value: "$rain %",
              wicon: FontAwesomeIcons.cloudRain,
              measure: "Rain"),
        ],
      ),
    );
  }
}
