import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';

class WeatherDetails extends StatelessWidget {
  final width, height, weatherDesp, temp, day;
  const WeatherDetails(
      {Key? key,
      this.width,
      this.height,
      this.weatherDesp,
      this.temp,
      this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Image.asset(
            selectIcon(weatherDesp),
            height: width * 0.4,
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$day",
                style: smallCardPrimaryText.copyWith(
                    fontSize: width * 0.08, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${temp.toStringAsFixed(1)}",
                    style: smallCardPrimaryText.copyWith(
                        fontSize: width * 0.2, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "$degree",
                    style: smallCardPrimaryText.copyWith(
                        fontSize: width * 0.1, color: Color(0xffdbdbdb)),
                  ),
                ],
              ),
              SizedBox(height: 1.0),
              Text(
                "$weatherDesp",
                style: SecondaryTextStyle.copyWith(
                    fontSize: width * 0.06,
                    color: Color(0xffdbdbdb),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ],
    );
  }
}
