import 'dart:convert';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/loginResponse.dart';
import 'package:dawey/Screens/Comman/Profile.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/otpView.dart';
import 'package:dawey/Screens/DeliveryBoyScreen/deliveryRegister.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class LoginController extends GetxController {
  var isChecked = false.obs;
  var isLoading = false.obs;
  String lattitude = "";
  final FocusNode focus = FocusNode();
  final Geolocator geolocator = Geolocator();

  TextEditingController mobileController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  smbRegister(int flag) {
    if (validate()) {
      if (flag == 0) {
        callRegisterAPI();
      } else {
        callLoginAPI();
      }
    }
  }

  getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      lattitude =
          position.latitude.toString() + "," + position.longitude.toString();
      setPrefValue(Keys.REGISTER_LAT_LONG, lattitude);
    }).catchError((e) {
      print(e);
    });
  }

  bool validate() {
    if (mobileController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("mobile_no_required")}');
      return false;
    }

    return true;
  }

  callLoginAPI() async {
    isLoading.value = true;
    loginApi(mobileController.value.text, lattitude).then((value) {
      var response = json.decode(value.body);

      if (response["success"] == "true") {
        isLoading.value = false;
        mySnackbar(
            title: '${getLabel("success")}',
            description: response["result"]["message"]);
        print("skip_login is ${response["result"]["skip_login"]}");
        setLoginResponse(response["result"]);
        if (response["result"]["role"] == "0") {
          if(response["result"]["skip_login"]=="0"){
            Get.off(OtpView(0, "login"));
          }else{
            Get.offAll(Home(0));
          }
        } else {
          Get.offAll(DeliveryRegister(screenFlag: 1,skipLogin:response["result"]["skip_login"]));
        }
      } else {
        mySnackbar(
            title: '${getLabel("error")}',
            description: '${getLabel("no_customer_available")}');
        isLoading.value = false;
      }
    });
  }

  void callRegisterAPI() {
    registerApi(mobileController.value.text, lattitude).then((data) {
      isLoading.value = true;
      var response = json.decode(data.body);
      if (response['success'] == "true") {
        setPrefValue(
            Keys.CUSTOMERID, response['result']['customer_id'].toString());
        setPrefValue(Keys.MOBILE, response['result']['mobile_no'].toString());
        setPrefValue(Keys.OTP, response['result']['otp'].toString());
        mobileController.clear();
        isLoading.value = false;
        mySnackbar(
            title: '${getLabel("success")}',
            description: response['result']['message']);
        Get.off(OtpView(0, ""));
      } else {
        isLoading.value = false;
        mySnackbar(
            title: '${getLabel("error")}',
            description: '${getLabel("mobile_exist")}');
      }
    });
  }

  void setLoginResponse(response) {
    setPrefValue(Keys.CUSTOMERID, response["customer_id"].toString());
    setPrefValue(Keys.DBOYID, response["dboy_id"]);
    print(getPrefValue(Keys.DBOYID));
    setPrefValue(Keys.ROLE, response["role"].toString());
    setPrefValue(Keys.OTP, response["otp"].toString());
    setPrefValue(Keys.USER_LOCATION, response["lat_long"].toString());
    setPrefValue(Keys.MOBILE, response["mobile_no"].toString());
    setPrefValue(
        Keys.NAME,
        response["firstname"].toString() +
            " " +
            response["lastname"].toString());
    setPrefValue(Keys.NUMBER_VERIFY_FLAG, response["is_mverify"]);
    //setPrefValue(Keys.EMAIL, response['email_id']);
    setPrefValue(
        Keys.NAME,
        response["firstname"].toString() +
            " " +
            response["lastname"].toString());
    AppConstants.MOBILENO = response["mobile_no"].toString();
    AppConstants.NAME = response["firstname"].toString() +
        " " +
        response["lastname"].toString();

    Map<String, dynamic> userDataList = {};
    setPrefValue(Keys.ROLE, response["role"].toString());
    userDataList.addAll({
      "customer_id": "${response["customer_id"]}",
      "national_id": "${response["national_id"]}",
      "firstname": "${response["firstname"].toString()}",
      "lastname": "${response["lastname"].toString()}",
      "email": "${response["email"].toString()}",
      "mobile_no": "${response["mobile_no"].toString()}",
      "password": "${response["password"].toString()}",
      "address": "${response["address"].toString()}",
      "way_number": "${response["way_number"].toString()}",
      "street_name": "${response["street_name"].toString()}",
      "house_building": "${response["house_building"].toString()}",
      "appartment_number": "${response["appartment_number"].toString()}",
      "city": "${response["city"].toString()}",
      "governorate": "${response["governorate"].toString()}",
      "role": "${response["role"].toString()}",
      "is_active": "${response["is_active"].toString()}",
      "is_verify": "${response["is_verify"].toString()}",
      "token": "${response["token"].toString()}",
      "password_reset_code": "${response["password_reset_code"].toString()}",
      "last_ip": "${response["last_ip"].toString()}",
    });
    String usersItems = jsonEncode(userDataList);

    setPrefValue(Keys.USER_DATA__OBJECT, usersItems);
    mobileController.clear();

    /*    var response = json.decode(getPrefValue(Keys.USER_DATA__OBJECT));

      print("user name is ${response["firstname"]}");*/
  }
}
