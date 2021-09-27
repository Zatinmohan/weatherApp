import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/misc/apiUrl.dart';
import 'package:weather/misc/constants.dart';

class AboutMe extends StatelessWidget {
  final width, height;
  const AboutMe({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10.0,
        sigmaY: 10.0,
      ),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: width,
          height: height,
          child: Card(
            color: backgroundColor,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    devImg,
                  ),
                  radius: width * 0.15,
                ),
                SizedBox(height: 15.0),
                Text(
                  "Jatin Mohan",
                  style: DaysTextStyle.copyWith(fontSize: width * 0.08),
                ),
                SizedBox(height: 2.0),
                Text(
                  "Application Developer",
                  style: SecondaryTextStyle.copyWith(fontSize: width * 0.05),
                ),
                SizedBox(height: 15.0),
                Divider(
                  color: secondaryTextColor2,
                  height: 5.0,
                  endIndent: width * 0.1,
                  indent: width * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async => await canLaunch(instagram)
                          ? await launch(instagram)
                          : throw "cound not find $instagram",
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Color(0xffE4405F),
                      ),
                    ),
                    IconButton(
                      onPressed: () async => await canLaunch(email)
                          ? await launch("mailto:$email")
                          : throw "cound not open your email client",
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Color(0xffEA4335),
                      ),
                    ),
                    IconButton(
                      onPressed: () async => await canLaunch(github)
                          ? await launch(github)
                          : throw "cound not find $github",
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () async => await canLaunch(linkedIn)
                          ? await launch(linkedIn)
                          : throw "cound not find $linkedIn",
                      icon: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Color(0xff0A66C2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
