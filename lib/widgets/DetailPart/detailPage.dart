import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/globalController.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/misc/dailyWeather.dart';
import 'package:weather/misc/weatherDataCurrent.dart';
import 'package:weather/widgets/UpperPart/cardDesign.dart';
import 'package:get/get.dart';

class DetailWeather extends StatelessWidget {
  final Current? currentWeather;
  GlobalController controller = Get.find();
  final width, height;
  DetailWeather({Key? key, this.currentWeather, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Daily>? daily = controller.getData().getDailyWeather().daily;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              CardDesign(
                width: width,
                height: height * 0.5,
                index: 0,
                temp: currentWeather?.temp,
                weatherDesp: currentWeather?.weather![0].description,
                mainName: "N/A",
                day: currentWeather?.dt,
                wind: currentWeather?.windSpeed,
                rain: currentWeather?.clouds,
                humidity: currentWeather?.humidity,
                isDetailpage: true,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: daily?.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    print(daily?.length);
                    var data = daily![index];
                    String day = DateFormat('EEE').format(
                        DateTime.fromMillisecondsSinceEpoch(data.dt! * 1000));
                    String desp = data.weather![0].description!;

                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.004, horizontal: width * 0.06),
                      leading: Text(
                        "$day",
                        style: SecondaryTextStyle.copyWith(
                            fontSize: width * 0.058,
                            fontWeight: FontWeight.w600),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            selectIcon(data.weather![0].description!),
                            height: width * 0.1,
                          ),
                          SizedBox(width: 5.0),
                          Text("${data.weather![0].mainDesp}",
                              style: SecondaryTextStyle.copyWith(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      trailing: Text(
                        "${data.temp?.day}",
                        style: DaysTextStyle.copyWith(
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.w700),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
