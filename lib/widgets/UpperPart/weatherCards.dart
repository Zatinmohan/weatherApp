import 'package:flutter/material.dart';
import 'package:weather/misc/dailyWeather.dart';
import 'cardDesign.dart';

class WeatherCard extends StatefulWidget {
  final width, height;
  final Future<DailyWeather>? dailyWeather;
  const WeatherCard({Key? key, this.width, this.height, this.dailyWeather})
      : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard>
    with SingleTickerProviderStateMixin {
  List cards = [];

  int? currentIndex;
  AnimationController? controller;
  CurvedAnimation? curvedAnimation;
  Animation<Offset>? _translationAnim;
  Animation<Offset>? _moveAnim;
  Animation<double>? _scaleAnim;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;

    widget.dailyWeather?.then((value) {
      for (int i = 0; i < 4; i++) {
        var temp = value.daily![i].temp?.day;
        var windSpeed = value.daily![i].windSpeed;
        var day = value.daily![i].dt;
        var humidity = value.daily![i].humidity;
        var rain = value.daily![i].clouds;
        var weatherName = value.daily![i].weather![0].main;
        var weatherDescription = value.daily![i].weather![0].description;

        setState(() {
          cards.add(CardDesign(
            width: widget.width,
            height: widget.height,
            index: i + 1,
            temp: temp,
            rain: rain,
            wind: windSpeed,
            humidity: humidity,
            weatherDesp: weatherDescription,
            mainName: weatherName,
            day: day,
          ));
        });
      }
    });

    // cards.add(CardDesign(
    //   width: widget.width,
    //   height: widget.height,
    //   index: 1,
    //   // temp: widget.dailyWeather?.then((value) => value.daily![0].temp?.day),
    // ));
    // cards.add(CardDesign(
    //   width: widget.width,
    //   height: widget.height,
    //   index: 2,
    //   // temp: widget.dailyWeather?.then((value) => value.daily![1].temp?.day),
    // ));
    // cards.add(CardDesign(
    //   width: widget.width,
    //   height: widget.height,
    //   index: 3,
    //   // temp: widget.dailyWeather?.then((value) => value.daily![2].temp?.day),
    // ));
    // cards.add(CardDesign(
    //   width: widget.width,
    //   height: widget.height,
    //   index: 4,
    //   // temp: widget.dailyWeather?.then((value) => value.daily![3].temp?.day),
    // ));

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    curvedAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.fastOutSlowIn);

    _translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(500, 0.0))
        .animate(controller!)
          ..addListener(() {
            setState(() {});
          });

    _scaleAnim = Tween(begin: 0.2, end: 0.5).animate(curvedAnimation!);
    _moveAnim = Tween(begin: Offset(0.0, 0.05), end: Offset(0.0, 0.01))
        .animate(curvedAnimation!);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // color: Colors.green,
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Stack(
          clipBehavior: Clip.none,
          children: cards.reversed.map((card) {
            return Dismissible(
              crossAxisEndOffset: 0.2,
              dismissThresholds: {
                DismissDirection.startToEnd: 0.2,
                DismissDirection.endToStart: 0.2,
              },
              key: UniqueKey(),
              child: FractionalTranslation(
                translation: _getStackedCardOffset(card),
                child: Transform.scale(
                  scale: getStackedCardScale(card),
                  child: card,
                ),
              ),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  var temp = cards.removeAt(0);
                  cards.add(temp);
                  currentIndex = cards[0].index;
                });
              },
            );
          }).toList()),
    );
  }

  void dragDetails(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      controller!.forward().whenComplete(() {
        setState(() {
          controller!.reset();
          var temp = cards.removeAt(0);
          cards.add(temp);
          currentIndex = cards[0].index;
        });
      });
    }
  }

  double getStackedCardScale(var c) {
    int diff = c.index - currentIndex;

    if (c.index == currentIndex)
      return 1.0;
    else if (c.index == currentIndex! + 1)
      return 1.01;
    else
      return (1.0 + diff * 0.01);
  }

  Offset _getStackedCardOffset(var c) {
    int diff = c.index - currentIndex;
    if (c.index == currentIndex! + 1)
      return Offset(0.0, 0.01);
    else if (diff > 0 && diff <= 2)
      return Offset(0.0, 0.02);
    else if (diff > 2 && diff <= 3)
      return Offset(0.0, 0.03);
    else
      return Offset(0.0, 0.0);
  }

  Offset _getFlickTransformation(var c) {
    if (c.index == currentIndex) return _translationAnim!.value;

    return Offset(0.0, 0.0);
  }
}
