import 'package:flutter/material.dart';
import 'package:weather/MainSceen.dart';
import 'package:weather/misc/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: MainScreen(),
    );
  }
}
