import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/otpView.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryLoginController extends GetxController {
  final FocusNode focus = FocusNode();

  TextEditingController nameController = TextEditingController(text: AppConstants.NAME);
  TextEditingController mobileController = TextEditingController(text: AppConstants.MOBILENO);

  smbRegister(String screenFlag) {
     if (validate()) {
       if(screenFlag=="1"){
         Get.offAll(Home(1));
       }else{
         Get.off(OtpView(1,"del"));

       }
    }
  }

  bool validate() {
    if (nameController.text.isEmpty) {
      mySnackbar(title: 'Empty', description: 'Name required');
      return false;
    }
    if (mobileController.text.isEmpty) {
      mySnackbar(title: 'Empty', description: 'Mobile number required');
      return false;
    }

    return true;
  }
}
