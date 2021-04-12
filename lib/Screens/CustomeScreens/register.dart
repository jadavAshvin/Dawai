import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Screens/Comman/f&q.dart';
import 'package:dawey/Screens/CustomerController/LoginController/loginController.dart';
import 'package:dawey/Screens/CustomerController/LoginController/loginController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/imageView.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  int flag;
  Register(this.flag);

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
                  setIcon(),
                  SizedBox(
                    height: 10,
                  ),
                  setInputView(),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return loginController.isLoading.value
                        ? CupertinoActivityIndicator(
                            radius: 18,
                          )
                        : CustomButton(
                            flag == 0
                                ? getLabel("register")
                                : getLabel("login"), () {
                            loginController.smbRegister(flag);
                          });
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  flag == 0
                      ?  InkWell(
                    onTap: (){
                      Get.to(FAQ());
                    },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                    getLabel("Why_register"),
                    style: textFieldTextBoldStyle(20, black),
                  ),
                        ),
                      ):Container(),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   getLabel("orregister"),
                  //   style: textFieldTextBoldStyle(20, black),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  //   setSocialView(),
                  SizedBox(
                    height: 100,
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

  setIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Image.asset(
        Images.REGISTER,
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
            height: 70.0,
            child: TextFormField(
              maxLines: 1,
              style: textFieldTextStyle(16, black),
              keyboardType: TextInputType.number,
              controller: loginController.mobileController,
              // maxLength: 10,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  //labelText: getLabel("mobile_no"),
                  hintText: getLabel("mobile_no"),
                  hintStyle: TextStyle(color: black),
                  contentPadding: EdgeInsets.all(5)),
              onFieldSubmitted: (_) {
                loginController.focus.unfocus();
                loginController.smbRegister(flag);
              },
              onChanged: (text) {},
            ))
      ],
    );
  }


}
