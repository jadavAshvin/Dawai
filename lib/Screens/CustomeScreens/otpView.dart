import 'dart:async';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Screens/Comman/Profile.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/DeliveryBoyScreen/deliveryRegister.dart';
import 'package:dawey/Screens/DeliveryBoyScreen/myTask.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/showTopBottomImage.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpView extends StatefulWidget {
  int screenlag;
  String screenName;
  OtpView(this.screenlag, this.screenName);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  TextEditingController _smsCodeController = TextEditingController()..text = "";

  final formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  String smsOTP = "";

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Scaffold(
        backgroundColor: white,
        body: BackgroundWidget(
          child: Stack(
            children: [
              ListView(
                children: [
                  appBar(),
                  Column(
                    children: [
                      SizedBox(
                        height: 230,
                      ),
                    /*  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "${getLabel("otp_is")} - " + getPrefValue(Keys.OTP),
                            style: textFieldTextStyle(18, black),
                          ),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            getLabel("otp_submit"),
                            style: textFieldTextStyle(18, black),
                          ),
                        ),
                      ),
                      setOTPView(context),
                      SizedBox(
                        height: 30,
                      ),
                      //   CustomButton(txtSubmit, (){Get.to(Profile());})
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: iconsBotton(),
    );
  }

  Widget setOTPView(
    BuildContext context,
  ) {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
        child: Center(
          child: PinCodeTextField(
            length: 4,
            onSubmitted: (s) {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              //  checkVerify();
            },
            obsecureText: false,
            animationType: AnimationType.fade,
            textInputType: TextInputType.number,
            pinTheme: PinTheme(
                inactiveFillColor: Colors.white,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                disabledColor: Colors.grey,
                fieldWidth: Get.width/6,
                fieldHeight: 45,
                activeFillColor: buttonColor,
                activeColor: buttonColor,
                inactiveColor: buttonColor,
                selectedFillColor: buttonColor),
            animationDuration: Duration(milliseconds: 300),
            // backgroundColor: Colors.white,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: _smsCodeController,
            onCompleted: (value) {
              print("FULL VALUE : " + value);
              smsOTP = value;
              if (value != getPrefValue(Keys.OTP)) {
                Get.snackbar('${getLabel("invalid_otp")}', '',);
                errorController.add(ErrorAnimationType.shake); // Triggering error shake animation
                setState(() {
                  hasError = true;
                });
              } else {
                setState(() {
                  hasError = false;
                  setPrefValue(Keys.NUMBER_VERIFY_FLAG, '1');
                  if (widget.screenName == "login") {
                    if (widget.screenlag == 0) {
                      Get.offAll(Home(0));
                    } else {
                      Get.offAll(Home(1));
                    }
                  } else if (widget.screenName == "del") {
                    if (widget.screenlag == 1) {
                      Get.offAll(MyTask(0));
                    }
                  } else {
                    if (widget.screenlag == 0) {
                      Get.offAll(Profile(widget.screenlag, 'otpView'));
                    }
                    /*else {
                      Get.to(MyTask(0));
                    }*/
                  }
                });
              }
            },
            onChanged: (value) {
              print(value);
              smsOTP = value;
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
        ),
      ),
    );
  }
}
