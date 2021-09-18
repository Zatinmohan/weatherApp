import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/api/weather.dart';
import 'package:weather/misc/constants.dart';

import 'package:weather/misc/weatherData.dart';

import 'package:weather/widgets/LowerPart/weatherDetails.dart';
import 'package:weather/widgets/UpperPart/weatherCards.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? latitude, longitude;
  Future<weatherData>? _weatherInfo;
  // String _address, _dateTime;

  Future<void> _getLoc() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return Future.error("Location not Enabled");

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied)
        return Future.error("Location permissions are denied");
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      print("Latitude: ${location.latitude} Longitude: ${location.longitude}");
      _weatherInfo =
          APIManager().processData(location.latitude, location.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    if (_weatherInfo == null) _getLoc();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _weatherInfo != null
              ? Column(
                  children: [
                    WeatherCard(
                      width: width,
                      height: height * 0.80,
                      dailyWeather: _weatherInfo
                          ?.then((value) => value.getDailyWeather()),
                    ),
                    SizedBox(height: 20.0),
                    WeatherDetail(width: width, height: height),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
