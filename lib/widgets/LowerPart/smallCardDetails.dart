import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';

class SmallDetails extends StatelessWidget {
  final width, height;
  const SmallDetails({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var degree = "°";
    var temp = "23";
    var icon;
    var time = "10:00";

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "$temp$degree",
          style: smallCardPrimaryText.copyWith(fontSize: width * 0.05),
        ),
        Icon(
          Icons.cloud,
          size: width * 0.08,
          color: Colors.white,
        ),
        Text("$time",
            style: SecondaryTextStyle.copyWith(
              fontSize: width * 0.04,
              color: secondaryTextColor2,
            )),
      ],
    );
  }
}
