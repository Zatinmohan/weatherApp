import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/globalController.dart';
import 'package:weather/misc/constants.dart';
import 'package:weather/widgets/DetailPart/aboutme.dart';

class CustomAppBar extends StatelessWidget {
  final width, height;
  const CustomAppBar({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalController _controller = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: width * 0.065,
            )),
        title: Center(
          child: Text(
            "Today",
            style: SecondaryTextStyle.copyWith(
              color: textColor,
              fontSize: width * 0.07,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing: PopupMenuButton(
          onSelected: (result) {
            if (result == 2) {
              showDialog(context: context, builder: (context) => AboutMe(width:width,height:height));
            }
          },
          color: backgroundColor,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text(
                "Settings",
                style: TextStyle(color: textColor),
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Text(
                "About",
                style: TextStyle(color: textColor),
              ),
              value: 2,
            ),
          ],
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: width * 0.065,
          ),
        ),
      ),
    );
  }
}
