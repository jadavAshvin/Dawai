import 'dart:convert';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalCenterController extends GetxController {
  var pickUp = 0.obs;
  var pending = 1.obs;

  var pickupResult = List<Map<String, String>>().obs;

  var pendingPickupResult = List<Map<String, String>>().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getDeliveryBoyTaskAPI(flag) {
    getMyDelBoyTaskListApi(getPrefValue(Keys.DBOYID), AppConstants.PHARMACYID, flag).then((data) {
      if (data.success == "true") {
        // ignore: deprecated_member_use
        if (data.resultpickup.isEmpty) {
          pickupResult.value = [];
        } else {
          pickupResult.value = data.resultpickup;
        }
        if (data.resultpendingpickup.isEmpty) {
          pendingPickupResult.value = [];
        } else {
          pendingPickupResult.value = data.resultpendingpickup;
        }
      } else {
        pickupResult.value = [];
        pendingPickupResult.value = [];
      }
    });
  }

  void updateOrderStatus(orderId, String orderStatus, flag) {
    updateOrderStatusApi(orderId, orderStatus, "").then((data) {
      var response = json.decode(data.body);
      if (response['success'] == "true") {
        mySnackbar(title: '${getLabel("success")}', description: response['message']);
        getDeliveryBoyTaskAPI(flag);

      }else {
        mySnackbar(
            title: 'Error In Processing',
            description: 'Error processing Pickup please try again');
      }

    });
  }
}
