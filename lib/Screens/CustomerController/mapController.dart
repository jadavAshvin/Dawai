import 'dart:convert';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/langResponse.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/loginOptions.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  final FocusNode focus = FocusNode();

  TextEditingController orderPinController = TextEditingController();

  void updateOrderStatus(orderId, String orderStatus,String not_del_content) {
    updateOrderStatusApi(orderId, orderStatus,not_del_content).then((data) {
      var response = json.decode(data.body);

      if (response['success'] == "true") {
      mySnackbar(title: '${getLabel("success")}', description: response['message']);
      Future.delayed(const Duration(seconds: 2), () {
        Get.to(Home(1));
      });
    }else {
        mySnackbar(
            title: 'Error In Processing',
            description: 'Error processing Pickup please try again');
      }
    });
  }
}
