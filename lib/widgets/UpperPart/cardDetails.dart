import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/UpperPart/smallDetails.dart';

class CardDetails extends StatefulWidget {
  final height, width;
  const CardDetails({Key? key, this.height, this.width}) : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails>
    with SingleTickerProviderStateMixin {
  var degree = "°";
  late final AnimationController _controller;

  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    _animation = Tween(
      begin: Offset.zero,
      end: Offset(0, 0.08),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: SlideTransition(
            position: _animation,
            child: Image.asset(
              'assets/clouds/12.png',
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "21",
                  style: smallCardPrimaryText.copyWith(
                      fontSize: widget.height * 0.2),
                ),
                Text(
                  degree,
                  style: smallCardPrimaryText.copyWith(
                    fontSize: widget.height * 0.09,
                    color: secondaryTextColor2,
                  ),
                )
              ],
            )),
        Flexible(
          flex: 1,
          child: Text(
            "Thunderstorm",
            style: DaysTextStyle.copyWith(
                fontSize: widget.height * 0.06, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 2.0),
        Flexible(
          flex: 1,
          child: Text(
            "Friday, 10 Sept",
            style: SecondaryTextStyle.copyWith(
                fontSize: widget.height * 0.035, color: Color(0xffdbdbdb)),
          ),
        ),
        SizedBox(
          height: 2.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * 0.1),
          child: Divider(
            color: secondaryTextColor,
          ),
        ),
        SizedBox(height: 5.0),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallDetails(
                  width: widget.width,
                  height: widget.height,
                  value: "13 km/h",
                  wicon: FontAwesomeIcons.wind,
                  measure: "Wind"),
              SmallDetails(
                  width: widget.width,
                  height: widget.height,
                  value: "24%",
                  wicon: FontAwesomeIcons.tint,
                  measure: "Humidity"),
              SmallDetails(
                  width: widget.width,
                  height: widget.height,
                  value: "87%",
                  wicon: FontAwesomeIcons.cloudRain,
                  measure: "Rain"),
            ],
          ),
        ),
      ],
    );
  }
}
