import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/UpperPart/cardDetails.dart';

class CardDesign extends StatelessWidget {
  final height, width, index;
  const CardDesign({Key? key, this.height, this.width, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height + 10,
      decoration: BoxDecoration(
        border: Border.all(color: cardBorder, width: 0.6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70.0),
          bottomRight: Radius.circular(70.0),
        ),
        boxShadow: [
          BoxShadow(
            color: cardBorderGlow.withAlpha(50),
            blurRadius: 8.0,
            spreadRadius: 5.0,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cardColor,
            nextCardColor,
          ],
        ),
      ),
      child: CardDetails(width: width, height: height),
    );
  }
}
