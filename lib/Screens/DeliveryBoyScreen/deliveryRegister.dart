import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/DeliveryBoyController/deliveryLoginController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryRegister extends StatelessWidget {
  DeliveryLoginController loginController = Get.put(DeliveryLoginController());
  int screenFlag;
  String skipLogin;
  DeliveryRegister({this. screenFlag,this.skipLogin});

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Scaffold(
        backgroundColor: white,
        body: BackgroundWidget(
          child: ListView(
            children: [
              Column(
                children: [
                  appBar(),
                  Text(
                    getLabel("register"),
                    style: textFieldTextBoldStyle(25, Colors.black),
                  ),
                  setIcon(),
                  SizedBox(
                    height: 10,
                  ),
                  setInputView(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
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
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Get.back(),
      ),
    );
  }

  setIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Image.asset(
        Images.DELIVERY_MAN,
        fit: BoxFit.fitWidth,
        height: 250,
      ),
    );
  }

  setInputView() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            height: 60.0,
            child: TextFormField(
              maxLines: 1,
              style: textFieldTextStyle(16, black),
              keyboardType: TextInputType.name,
              controller: loginController.nameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                labelText: getLabel("mobile"),
                hintText: getLabel("mobile"),
              ),
              onFieldSubmitted: (_) {
                loginController.focus.nextFocus();
              },
              onChanged: (text) {},
            )),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Row(
            children: [
              Expanded(
                child: Container(
                    height: 60.0,
                    child: TextFormField(
                      maxLines: 1,
                      style: textFieldTextStyle(16, black),
                      keyboardType: TextInputType.number,
                      controller: loginController.mobileController,
                     // maxLength: 10,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        //border: OutlineInputBorder(),
                        labelText: getLabel("enter_mobile_no"),
                        hintText: getLabel("enter_mobile_no"),
                      ),
                      onFieldSubmitted: (_) {
                        loginController.focus.unfocus();
                        loginController.smbRegister(skipLogin);
                      },
                      onChanged: (text) {},
                    )),
              ),
              SizedBox(
                width: 8,
              ),
              CustomButton(getLabel("verify"), () {
                loginController.smbRegister(skipLogin);
              }),
            ],
          ),
        )
      ],
    );
  }
}
