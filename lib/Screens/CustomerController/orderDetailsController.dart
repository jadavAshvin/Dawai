import 'dart:convert';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Models/OrderStatusLog.dart';
import 'package:dawey/Models/orderDetails.dart';
import 'package:dawey/Models/order_details_all_response.dart' as AllOrder;
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//import 'package:intl/intl.dart';


import 'HomeController/home_content_controller.dart';

class OrderDetailsController extends GetxController {
  TextEditingController orderPinController = TextEditingController();

  //var orderDetail=  List<AllOrder.Result>().obs;

  // ignore: deprecated_member_use
  //var orderDetail= List<Result>().obs ;
  var invoiceno = "".obs;
  var mrn_no = "".obs;
  var mobile_no = "".obs;
  var address = "".obs;
  var street_name = "".obs;
  var way_number = "".obs;
  var national_id = "".obs;
  var house_building = "".obs;
  var appartment_number = "".obs;
  var governorate = "".obs;
  var city = "".obs;
  var order_status_name = "".obs;
  var order_status_arabic = "".obs;
  var color_code = "".obs;
  var lat_long = "".obs;
  var created_date = "".obs;
  var order_pin = "".obs;
  var order_delivery_Date = "".obs;
  var order_status_id = "".obs;
  var dilvery_Date = "".obs;
  var dilvery_time = "".obs;
  var nearest_med_center = "".obs;
  var not_del_content = "".obs;
  var orderLogLoading = false.obs;
  // ignore: deprecated_member_use
  List<OrderStatusLogResult> orderStatusLogResult = List<OrderStatusLogResult>().obs;
  @override
  void onInit() {}

  callDeliveryDateAPI(String id, String statusCode) async {
    orderDeliveryDate(id, statusCode).then((value) {
      var response = json.decode(value.body);

      if (response["success"] == "true") {
        print("delivery date is ${response["result"][0]["order_status_date"]}");
        String fullDate = response["result"][0]["order_status_date"].toString().split(" ")[0];
        String fulltime = response["result"][0]["order_status_date"].toString().split(" ")[1];
        String date = fullDate.split("-")[2] + "/" + fullDate.split("-")[1] + "/" + fullDate.split("-")[0];
        String time = fulltime.split(":")[0] + ":" + fulltime.split(":")[1] ;
        dilvery_Date.value = date;
        dilvery_time.value = time;
        print("Del date is  ${dilvery_Date.value}");
        print("Del Time is  $time");
      }
    });
  }

  void updateOrderStatus(orderId, String orderStatus, String not_del_content) {
    updateOrderStatusApi(orderId, orderStatus, not_del_content).then((data) {
      var response = json.decode(data.body);

      if (response['success'] == "true") {
        mySnackbar(title: '${getLabel("success")}', description: getLabel("order_status_success"));
        Future.delayed(const Duration(seconds: 1), () {
          AppConstants.HOME_CLICK = "";
          Get.offAll(Home(1));
          // Get.find<HomeContentController>().searchDeliveryListByQuery("0");
        });
      } else {
        mySnackbar(title: 'Error In Processing', description: 'Error processing Pickup please try again');
      }
    });
  }

  void OrderDetailsAPI(String invoiceNo) {
    getOrderDetailstApi(invoiceNo).then((data) async {
      var response = json.decode(data.body);
      if (response["success"] == "true") {
        invoiceno.value = response["result"][0]["invoice_no"];
        mrn_no.value = response["result"][0]["mrn_no"];
        mobile_no.value = response["result"][0]["mobile_no"];
        address.value = response["result"][0]["address"];
        national_id.value = response["result"][0]["national_id"];
        street_name.value = response["result"][0]["street_name"];
        way_number.value = response["result"][0]["way_number"];
        house_building.value = response["result"][0]["house_building"];
        appartment_number.value = response["result"][0]["appartment_number"];
        governorate.value = response["result"][0]["governorate"];
        city.value = response["result"][0]["city"];
        order_status_name.value = response["result"][0]["order_status_name"];
        order_status_arabic.value = response["result"][0]["order_status_arabic"];
        color_code.value = response["result"][0]["color_code"];
        lat_long.value = response["result"][0]["lat_long"];
        not_del_content.value = response["result"][0]["not_del_content"];
        created_date.value = response["result"][0]["created_date"];
        order_pin.value = response["result"][0]["order_pin"];
        order_delivery_Date.value = response["result"][0]["delivery_date"];
        order_status_id.value = response["result"][0]["order_status_id"];
        nearest_med_center.value = response["result"][0]["pharmacy_name"];
        callDeliveryDateAPI(
          response["result"][0]["id"].toString(),
          response["result"][0]["order_status_id"].toString(),
        );
        orderStatusLog(
          response["result"][0]["id"].toString(),
        );
      }
      /* if (data.success == "true") {
        print("lat long is ${data.result[0].latLong}");
        orderDetail.value=data.result;
      }*/
    });
  }

  void orderStatusLog(invoiceNo) {
    getOrderStatusLogApi(invoiceNo).then((response) {
      if (response.success == "true") {
        orderStatusLogResult = response.orderstatuslogresult;
      } else {
        orderStatusLogResult = [];
      }
    });
    Get.forceAppUpdate();
  }
}
