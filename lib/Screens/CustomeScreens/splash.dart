import 'dart:convert';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/Comman/select_lang.dart';
import 'package:dawey/Screens/CustomeScreens/loginOptions.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Pref.init();

    Future.delayed(const Duration(seconds: 3), () {
      print("LAND" + Pref.getString(Pref.IS_ENGLISH).toString());
      print("customer id " + getPrefValue(Keys.CUSTOMERID));
      print("ROLE id " + getPrefValue(Keys.ROLE));
      if (getPrefValue(Keys.CUSTOMERID) != "") {
        Get.offAll(Home(0)); //customer
      } else if (getPrefValue(Keys.DBOYID) != "") {
        Get.offAll(Home(1)); //delivery

      } else {
        Get.offAll(SelectLanguage()); //delivery
      }
      /*  if (Pref.getString(Pref.IS_ENGLISH) == "") {
        Get.offAll(SelectLanguage());
      } else {
        if (getPrefValue(Keys.CUSTOMERID) != "") {
          if (getPrefValue(Keys.ROLE) == "0") {
            Get.offAll(Home(1)); //customer
          } else {
            Get.offAll(Home(0)); //delivery
          }
        } else {
          Get.offAll(SelectLanguage()); //delivery
        }
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Image.asset(
                Images.LOGO,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
