import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/LowerPart/smallCardDetails.dart';

class SmallWeatherCards extends StatefulWidget {
  final height, width;
  const SmallWeatherCards({Key? key, this.height, this.width})
      : super(key: key);

  @override
  _SmallWeatherCardsState createState() => _SmallWeatherCardsState();
}

class _SmallWeatherCardsState extends State<SmallWeatherCards> {
  int? cardIndex;
  var smallCardColor = Colors.transparent;
  @override
  void initState() {
    cardIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var smallCard = [1, 2, 3, 4, 5, 6];

    return Container(
      width: widget.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: smallCard.length,
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
                  child:
                      SmallDetails(width: widget.width, height: widget.height),
                ),
              ),
            );
          }),
    );
  }
}
