import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/misc/hourlyWeather.dart';
import 'package:weather/widgets/LowerPart/smallCardDetails.dart';

class SmallWeatherCards extends StatefulWidget {
  final height, width;
  final List<Hourly>? hourlyData;
  const SmallWeatherCards({Key? key, this.height, this.width, this.hourlyData})
      : super(key: key);

  @override
  _SmallWeatherCardsState createState() => _SmallWeatherCardsState();
}

class _SmallWeatherCardsState extends State<SmallWeatherCards> {
  int? cardIndex;
  int? _length;
  var smallCardColor = Colors.transparent;

  @override
  void initState() {
    cardIndex = 0;
    _length = widget.hourlyData?.length ?? 0;
    super.initState();
    print(widget.hourlyData?.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _length! >= 12 ? 12 : _length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    cardIndex = index;
                  });
                },
                child: Container(
                  width: widget.width * 0.22,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: cardIndex == index
                            ? [cardColor, nextCardColor]
                            : [smallCardColor, smallCardColor]),
                    border: Border.all(
                      color: cardBorder,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: SmallDetails(
                    width: widget.width,
                    height: widget.height,
                    //temp: "25",
                    temp: widget.hourlyData![index].temp,
                    day: widget.hourlyData![index].dt,
                    weatherdesp:
                        widget.hourlyData![index].weather![0].description,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
