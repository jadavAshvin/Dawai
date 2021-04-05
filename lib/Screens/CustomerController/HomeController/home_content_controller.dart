import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Models/deliveryOrderListResponse.dart' as Delivery;
import 'package:dawey/Models/getProfile.dart';
import 'package:dawey/Models/orderList.dart';
import 'package:dawey/Models/orderStatusResponse.dart' as OrderStatus;
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContentController extends GetxController {
  var isChecked = false.obs;
  final FocusNode focus = FocusNode();
  var isLoading = false.obs;
  var filterMonth = 0.obs;
  var selectedValue = MonthSelction(title: "selec_filter", val: null).obs;
  GetProfileResponse getProfileResponse = GetProfileResponse();
  OrderStatus.Result selectedStatusValue = OrderStatus.Result(orderStatusId: "0", languageId: "0", name: "", color: "", icon: "", orderStatusName: "all_status", colorCode: "0");
  List<MonthSelction> monthSelection = [
    MonthSelction(title: "all", val: 0),
    MonthSelction(title: "last_month", val: 1),
    MonthSelction(title: "last_two_month", val: 2),
    MonthSelction(title: "last_three_month", val: 3),
    MonthSelction(title: "last_four_month", val: 4),
    MonthSelction(title: "last_five_month", val: 5),
    MonthSelction(title: "last_six_month", val: 6),
  ];
  TextEditingController searchController = TextEditingController();

  // ignore: deprecated_member_use
  var orderList = List<Result>().obs;
  var searchQuery = '0'.obs;
  var profilePIC="".obs;

  var deliveryList = List<Delivery.Result>().obs;

  var orderStatusList = List<OrderStatus.Result>().obs;
  @override
  void onInit() {
    super.onInit();
    getOrderListStatus();
    callOrderListAPI();
    getProfileCall();
    // searchDeliveryListByQuery("0");
  }

  void updateStatusDropDown(OrderStatus.Result value) {
    selectedStatusValue = value;
    if (getPrefValue(Keys.DBOYID) != "") {
      searchDeliveryListByQuery(selectedStatusValue.orderStatusId);
      update();
      Get.forceAppUpdate();
    } else {
      searchListByQuery(selectedStatusValue.orderStatusId);
      update();
      Get.forceAppUpdate();
    }
  }

  void getOrderListStatus() async {
    getOrderListStatusApi().then((data) {
      // ignore: deprecated_member_use
      if (data.success == "true") {
        orderStatusList.value = data.result;
      } else {
        orderStatusList.value = [];
      }
    });
  }

  void callOrderListAPI() {
    isLoading(true);
    if (getPrefValue(Keys.CUSTOMERID) != "") {
      getOrderListApi(getPrefValue(Keys.CUSTOMERID)).then((data) {
        isLoading(false);
        if (data.success == "true") {
          orderList.value = data.result;
          update();
        } else {
          orderList.value = [];
        }
      });
    }
  }

  void searchListByQuery(String statusFlag) {
    isLoading(true);

    dashBoardSearchApi(getPrefValue(Keys.CUSTOMERID), filterMonth.value, searchQuery.value, statusFlag

            /*getPrefValue(Keys.CUSTOMERID)*/
            )
        .then((data) {
      if (data.success == "true") {
        orderList.value = data.result;
        update();
      } else {
        orderList.value = [];
      }
    });
    isLoading(false);
  }

  void searchDeliveryListByQuery(String statUSFlag) {
    print("stsut sssss  ${AppConstants.HOME_CLICK}");
    isLoading(true);

    getDeliveryOrderListApi(getPrefValue(Keys.DBOYID), filterMonth.value.toString(), searchQuery.value, AppConstants.HOME_CLICK == "" ? statUSFlag : "3").then((data) {
      if (data.success == "true") {
        // orderList.value = data.result;
        // ignore: deprecated_member_use
        deliveryList.value = data.result;
        update();
      } else {
        deliveryList.value = [];
      }
    });
    isLoading(false);
  }

  updateDropDown(MonthSelction result) {
    selectedValue.value = result;

    update();
  }

  getProfileCall() async {
    if (getPrefValue(Keys.CUSTOMERID).isNotEmpty) {
      getProfileResponse = await getProfiletApi(getPrefValue(Keys.CUSTOMERID));
      setPrefValue(Keys.IMG_URL, getProfileResponse.getprofileresult[0].profileImage);
      setPrefValue(Keys.NATIONALI_FILE, getProfileResponse.getprofileresult[0].nationalIdFile);
      print("nnnnnnnnnnn   ${getPrefValue(Keys.NATIONALI_FILE)}");
      print("profile is   ${getProfileResponse.getprofileresult[0].profileImage}");
      AppConstants.PROFILE_IMAGE=getProfileResponse.getprofileresult[0].profileImage;
      profilePIC.value=getProfileResponse.getprofileresult[0].profileImage;
      Get.forceAppUpdate();
    }
  }
}

class MonthSelction {
  String title;
  int val;
  MonthSelction({this.title, this.val});
}
