import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/misc/weatherIcons.dart';

class SmallDetails extends StatelessWidget {
  final width, height, temp, day, weatherdesp;
  const SmallDetails(
      {Key? key,
      this.width,
      this.height,
      this.temp,
      this.day,
      this.weatherdesp})
      : super(key: key);

  String getTime(var day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('HH:MM').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    var icon;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "${temp.toStringAsFixed(1)}$degree",
          style: smallCardPrimaryText.copyWith(fontSize: width * 0.05),
        ),
        Image.asset(selectIcon(weatherdesp), height: height * 0.04),
        Text("${getTime(day)}",
            style: SecondaryTextStyle.copyWith(
              fontSize: width * 0.04,
              color: secondaryTextColor2,
            )),
      ],
    );
  }
}
