import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';

class SmallDetails extends StatelessWidget {
  final width, height, wicon, value, measure;
  const SmallDetails(
      {Key? key, this.width, this.height, this.wicon, this.value, this.measure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(wicon, color: textColor.withAlpha(150), size: width * 0.05),
        SizedBox(height: 4.0),
        Text("$value",
            style: smallCardPrimaryText.copyWith(
                fontSize: width * 0.04, fontWeight: FontWeight.normal)),
        SizedBox(height: 2.0),
        Text(
          "$measure",
          style: SecondaryTextStyle.copyWith(color: secondaryTextColor2),
        ),
      ],
    );
  }
}
