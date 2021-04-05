import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/CustomeScreens/register.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LoginOptions extends StatefulWidget {
  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();

  }
  getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {

    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                setIcon(),
                Text(
                  getLabel("new_user"),
                  style: textFieldTextBoldStyle(20, black),
                ),
                SizedBox(
                  height: 15,
                ),
                setSignUpButton(context),
                SizedBox(
                  height: 10,
                ),
                Text(
                  getLabel("already_have"),
                  style: textFieldTextBoldStyle(20, black),
                ),
                SizedBox(
                  height: 15,
                ),
                setLoginBUtton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Image.asset(
        Images.LOGIN,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  setSignUpButton(BuildContext context) {
    return Container(
      width: Pref.getString(Pref.IS_ENGLISH) == "0" ? 160 : 220,
      height: 50,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Get.to(Register(0));
        },
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  getLabel("sign_up"),
                  style: textFieldTextBoldStyle(20, white),
                ),
                Image.asset(
                  Images.ICON_SIGNUP,
                  width: 25.0,
                  height: 25.0,
                  color: Colors.white,
                ),
              ],
            )),
      ),
    );
  }
}

setLoginBUtton(BuildContext context) {
  return Container(
    width: Pref.getString(Pref.IS_ENGLISH) == "0" ? 150 : 215,
    height: 50,
    child: RaisedButton(
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        Get.to(Register(1));
      },
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                getLabel("login"),
                style: textFieldTextBoldStyle(20, white),
              ),
              Image.asset(
                Images.ICON_LOGIN,
                width: 25.0,
                height: 25.0,
              ),
            ],
          )),
    ),
  );
}
