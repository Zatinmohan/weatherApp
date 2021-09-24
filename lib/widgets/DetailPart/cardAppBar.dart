import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';

class CustomAppBar extends StatelessWidget {
  final width, height;
  const CustomAppBar({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => print("Back"),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: width * 0.065,
              )),
          Text(
            "Today",
            style: SecondaryTextStyle.copyWith(
                color: textColor,
                fontSize: width * 0.07,
                fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: () => print("options"),
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: width * 0.065,
              )),
        ],
      ),
    );
  }
}
