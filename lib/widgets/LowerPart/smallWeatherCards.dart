import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/LowerPart/smallCardDetails.dart';

class SmallWeatherCards extends StatelessWidget {
  final height, width;
  const SmallWeatherCards({Key? key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smallCard = [1, 2, 3, 4, 5, 6];

    return Container(
      width: width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: smallCard.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: width * 0.22,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: cardBorder,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: SmallDetails(width: width, height: height),
              ),
            );
          }),
    );
  }
}
