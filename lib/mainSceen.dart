import 'package:flutter/material.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/LowerPart/weatherDetails.dart';
import 'package:weather/widgets/UpperPart/weatherCards.dart';
import 'package:location/location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LocationData? _currentPosition;
  // String _address, _dateTime;
  Location location = Location();

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) return;
    }

    _currentPosition = await location.getLocation();
    setState(() {});

    print(
        "Latitude: ${_currentPosition?.latitude} Longitude: ${_currentPosition?.longitude}");
  }

  @override
  void initState() {
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _currentPosition != null
              ? Column(
                  children: [
                    WeatherCard(width: width, height: height * 0.80),
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
