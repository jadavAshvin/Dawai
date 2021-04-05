import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:get/get.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:get/get.dart';

class ThankYou extends StatelessWidget {
  int screenlag;

  ThankYou(this.screenlag);

  @override
  Widget build(BuildContext context) {

    return DirectionalWidget(
      child: Scaffold(
        body: BackgroundWidget(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 150.0.toHeight(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "${getLabel("status_ord_no")}. ${AppConstants.ORDER_NO} ${getLabel("with_MRN_NO")}. "
                            "${AppConstants.MRNNO} ${getLabel("dated") } ${
                                AppConstants.ORDER_DATE.split(" ")[0].split("-")[2]+"/"+
                                    AppConstants.ORDER_DATE.split(" ")[0].split("-")[1]+"/"+AppConstants.ORDER_DATE.split(" ")[0].split("-")[0]
                                } ${getLabel("is")} ",
                        style: textFieldTextStyle(20, black),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${getLabel("under_process")}",
                            style: TextStyle(
                                fontSize: 20, color: Color((0xFF007BFF))),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Text(
                        getLabel("thank_you"),
                        style: textFieldTextBoldStyle(25, black),
                      ),
                    ),
                  ),
                  CustomButton(getLabel("continue"), () {
                    Get.to(Home(screenlag));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
