import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/globalController.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/misc/hourlyWeather.dart';
import 'package:weather/widgets/LowerPart/smallCardDetails.dart';

class SmallWeatherCards extends StatelessWidget {
  final smallCardColor = Colors.transparent;
  int cardIndex = 0;
  final height, width;
  final List<Hourly>? hourlyData;
  SmallWeatherCards({Key? key, this.height, this.width, this.hourlyData})
      : super(key: key);

  GlobalController controller = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    RxInt cardIndex = controller.getIndex();
    return Container(
      width: width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyData!.length > 12 ? 12 : hourlyData!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Obx(() => GestureDetector(
                    onTap: () {
                      cardIndex.value = index;
                    },
                    child: Container(
                      width: width * 0.22,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: cardIndex.value == index
                                ? [cardColor, nextCardColor]
                                : [smallCardColor, smallCardColor]),
                        border: Border.all(
                          color: cardBorder,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: SmallDetails(
                        width: width,
                        height: height,
                        temp: hourlyData![index].temp,
                        day: hourlyData![index].dt,
                        weatherdesp: hourlyData![index].weather![0].description,
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
