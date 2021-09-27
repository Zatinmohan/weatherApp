import 'package:flutter/material.dart';

final cardColor = Color(0xff4884EE);
final nextCardColor = Color(0xff06BCFB);
final cardBorderGlow = Color(0xff1FD1F9);
final backgroundColor = Color(0xff171717);
final cardBorder = Color(0xff2B2B2B);
const textColor = Color(0xfffdfcfa);
const secondaryTextColor = Color(0xff808080);
const secondaryTextColor2 = Color(0xffdbdbdb);

final degree = "°";
const devImg = "assets/me.jpg";

//------- Height and Width-----
extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

const DaysTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: textColor,
);

const SecondaryTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: secondaryTextColor,
);

const smallCardPrimaryText = TextStyle(
  fontWeight: FontWeight.bold,
  color: textColor,
);
