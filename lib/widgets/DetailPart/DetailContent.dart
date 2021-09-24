import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/DetailPart/cardAppBar.dart';
import 'package:weather/widgets/DetailPart/smallDetails.dart';
import 'package:weather/widgets/DetailPart/weatherDetails.dart';
import 'package:weather/widgets/UpperPart/smallDetails.dart';

class DetailContent extends StatelessWidget {
  final temp, desp, rain, wind, humidity, day;
  final width, height;
  const DetailContent(
      {Key? key,
      this.width,
      this.height,
      this.temp,
      this.desp,
      this.rain,
      this.wind,
      this.day,
      this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Flexible(flex: 2, child: CustomAppBar(width: width, height: height)),
          SizedBox(height: 20.0),
          Flexible(
            flex: 5,
            child: WeatherDetails(
              width: width,
              height: height,
              weatherDesp: desp,
              temp: temp,
              day: DateFormat('EEEE')
                  .format(DateTime.fromMillisecondsSinceEpoch(day * 1000)),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Divider(
              height: 4.0,
              color: secondaryTextColor,
            ),
          ),
          SizedBox(height: 10.0),
          Flexible(
            flex: 2,
            child: SmallAnotherDetails(
              height: height,
              width: width,
              humidity: humidity,
              rain: rain,
              wind: wind,
            ),
          ),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
