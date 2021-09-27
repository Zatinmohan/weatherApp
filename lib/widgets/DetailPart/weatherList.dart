import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/misc/weatherIcons.dart';

class WeatherList extends StatelessWidget {
  final width, height, daily;
  const WeatherList({Key? key, this.width, this.height, this.daily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: daily?.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var data = daily![index];
          String day = DateFormat('EEE')
              .format(DateTime.fromMillisecondsSinceEpoch(data.dt! * 1000));

          return ListTile(
            contentPadding: EdgeInsets.symmetric(
                vertical: height * 0.004, horizontal: width * 0.06),
            leading: Text(
              "$day",
              style: SecondaryTextStyle.copyWith(
                  fontSize: width * 0.058, fontWeight: FontWeight.w600),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  selectIcon(data.weather![0].description!),
                  height: width * 0.1,
                ),
                SizedBox(width: 5.0),
                Text("${data.weather![0].mainDesp}",
                    style: SecondaryTextStyle.copyWith(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            trailing: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${data.temp?.day}",
                    style: DaysTextStyle.copyWith(
                        fontSize: width * 0.065, fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: "$degree",
                    style: SecondaryTextStyle.copyWith(
                      fontSize: width * 0.065,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
