import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';

class DaysDetails extends StatelessWidget {
  final width, height;
  const DaysDetails({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String days = "Today";
    const String _tDay = "7 Days";
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$days",
            style: DaysTextStyle.copyWith(fontSize: width * 0.065),
          ),
          Row(
            children: [
              Text(
                "$_tDay",
                style: SecondaryTextStyle.copyWith(fontSize: width * 0.055),
              ),
              IconButton(
                  onPressed: () => print("More Pressed"),
                  icon: Icon(Icons.arrow_forward_ios,
                      color: secondaryTextColor, size: width * 0.055)),
            ],
          ),
        ],
      ),
    );
  }
}
