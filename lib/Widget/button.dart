import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Screens/CustomeScreens/otpView.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function() onTab;
  CustomButton(
    this.title,  this. onTab,
  );

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Container(
        height: 45,
        child: RaisedButton(
          color: buttonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: onTab,
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                title,
                style: textFieldTextBoldStyle(18, white),
              )),
        ),
      ),
    );
  }
}
