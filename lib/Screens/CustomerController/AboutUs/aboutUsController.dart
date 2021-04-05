
import 'dart:convert';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/aboutUsResponse.dart';
import 'package:dawey/Models/langResponse.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/loginOptions.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AboutUsController extends GetxController {
  // ignore: deprecated_member_use
  var aboutUsList= List<Result>().obs;
  TextEditingController feedBackController = TextEditingController();
  final FocusNode focus = FocusNode();
  var isLoading = false.obs;

  @override
  void onInit() {

    print("langauge is ${Pref.getString(Pref.IS_ENGLISH)}");
  }

  bool validate() {

    if (feedBackController.text.isEmpty) {
      mySnackbar(title: '${getLabel("empty")}', description: '${getLabel("send_feedback_required")}');
      return false;
    }else if(feedBackController.text.length<10){
      mySnackbar(title: '${getLabel("empty")}', description: '${getLabel("feedback_10_character")}');
      return false;

    }

    return true;
  }
  callSendFeedbackAPI() async {
    if (validate()) {
      isLoading.value = true;
      sendFeedback(getPrefValue(Keys.CUSTOMERID),feedBackController.value.text).then((value) {
        var response = json.decode(value.body);
        if (response["success"] == "true") {
          isLoading.value = false;
          feedBackController.clear();
          mySnackbar(title: '${getLabel("success")}', description: response["result"]);
          Future.delayed(const Duration(seconds: 1), () {
            Get.back();
          });

        } else {
          mySnackbar(title: '${getLabel("error")}', description: response["result"]);
          isLoading.value = false;
        }
      });
    }

  }


  void aboutUsAPI() {
    String language_id="";
    String cms_id="";
    if(Pref.getString(Pref.IS_ENGLISH)=="0"){
      language_id="1";
      cms_id="1";
    }else{
      language_id="2";
      cms_id="3";
    }
    getAboutUstApi(language_id,cms_id)
        .then((data) {
      if (data.success == "true") {
        // ignore: deprecated_member_use
        aboutUsList.value=data.result;
      }
    });
  }

  void privacyPolicyAPI() {
    String language_id="";
    String cms_id="";
    if(Pref.getString(Pref.IS_ENGLISH)=="0"){
      language_id="1";
      cms_id="2";
    }else{
      language_id="2";
      cms_id="4";
    }
    getAboutUstApi(language_id,cms_id)
        .then((data) {
      if (data.success == "true") {
        // ignore: deprecated_member_use
        aboutUsList.value=data.result;
      }
    });
  }  void fAndQAPI() {
    String language_id="";
    String cms_id="";
    if(Pref.getString(Pref.IS_ENGLISH)=="0"){
      language_id="1";
      cms_id="7";
    }else{
      language_id="2";
      cms_id="8";
    }
    getAboutUstApi(language_id,cms_id)
        .then((data) {
      if (data.success == "true") {
        // ignore: deprecated_member_use
        aboutUsList.value=data.result;
      }
    });
  }void contactUsAPI() {
    String language_id="";
    String cms_id="";
    if(Pref.getString(Pref.IS_ENGLISH)=="0"){
      language_id="1";
      cms_id="5";
    }else{
      language_id="2";
      cms_id="6";
    }
    getAboutUstApi(language_id,cms_id)
        .then((data) {
      if (data.success == "true") {
        // ignore: deprecated_member_use
        aboutUsList.value=data.result;
      }
    });
  }

}