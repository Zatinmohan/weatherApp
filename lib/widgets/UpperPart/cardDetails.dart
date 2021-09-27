import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/misc/weatherIcons.dart';
import 'package:weather/widgets/UpperPart/smallDetails.dart';

class CardDetails extends StatefulWidget {
  final height,
      width,
      temp,
      day,
      weatherName,
      weatherDesp,
      wind,
      humidity,
      rain;
  const CardDetails(
      {Key? key,
      this.height,
      this.width,
      this.temp,
      this.day,
      this.weatherName,
      this.weatherDesp,
      this.wind,
      this.humidity,
      this.rain})
      : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<Offset> _animation;

  String _getDateTime(var dt) {
    DateTime x = DateTime.fromMillisecondsSinceEpoch(widget.day * 1000);
    String y = DateFormat('EEEE, d MMMM').format(x);
    return y;
  }

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
              selectIcon(widget.weatherDesp),
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "${widget.temp}",
                      style: smallCardPrimaryText.copyWith(
                          fontSize: widget.width * 0.28),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    degree,
                    style: smallCardPrimaryText.copyWith(
                      fontSize: widget.width * 0.12,
                      color: secondaryTextColor2,
                    ),
                  ),
                )
              ],
            )),
        Flexible(
          flex: 1,
          child: Text(
            "${toBeginningOfSentenceCase(widget.weatherDesp)}",
            style: DaysTextStyle.copyWith(
                fontSize: widget.height * 0.06, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 2.0),
        Flexible(
          flex: 1,
          child: Text(
            _getDateTime(widget.day),
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
                  value: "${widget.wind} km/hr",
                  wicon: FontAwesomeIcons.wind,
                  measure: "Wind"),
              SmallDetails(
                  width: widget.width,
                  height: widget.height,
                  value: "${widget.humidity}%",
                  wicon: FontAwesomeIcons.tint,
                  measure: "Humidity"),
              SmallDetails(
                  width: widget.width,
                  height: widget.height,
                  value: "${widget.rain}%",
                  wicon: FontAwesomeIcons.cloudRain,
                  measure: "Rain"),
            ],
          ),
        ),
      ],
    );
  }
}
