import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/myTaskResponse.dart';
import 'package:dawey/Models/pharmacyModel.dart';
import 'package:dawey/Models/pharmacyModel.dart';
import 'package:dawey/Screens/DeliveryBoyController/medicalCenterController.dart';
import 'package:dawey/Screens/DeliveryBoyScreen/medicalCenter.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawey/Models/pharmacyResponse.dart' as Pharmacy;

class MyTaskController extends GetxController {
  var day = "".obs, month = "".obs, year = "".obs;
  var selectedDate = "".obs;
  var pendingCount = 0.obs;
  var newCount = 0.obs;
  DateTime now = DateTime.now();

  // ignore: deprecated_member_use
  var phararmacyList = List<Pharmacy.Result>().obs;
  Pharmacy.Result selectedValue = Pharmacy.Result(
      pharmacyId: "0",
      pharmacyname: getLabel("all_medical_center"),
      pharmacynameAb: getLabel("all_medical_center"),
      latLong: "0");
  var filterMonth = 6.obs;
  var selectedValueTask =
      PickUpSelction(title: '${getLabel("pending_pickup")}', val: 0).obs;
  List<PickUpSelction> pickupSelection = [
    PickUpSelction(title: '${getLabel("pickup")}', val: 1),
    PickUpSelction(title: '${getLabel("pending_pickup")}', val: 2),
    PickUpSelction(title: '${getLabel("delivered")}', val: 3),
    PickUpSelction(title: '${getLabel("not_delivered")}', val: 4),
    PickUpSelction(title: '${getLabel("all")}', val: 0),
  ];

  var myTaskList = Result().obs;

  @override
  void onInit() {
    super.onInit();
    getPharmacy();
    getTaskAPI();
  }

  void getPharmacy() async {
    getPharmacyApi("").then((data) {
      // ignore: deprecated_member_use
      phararmacyList.value = data.result;
      update();
      Get.forceAppUpdate();
    });
  }

  smbContinue(int screenlag, flag) {
    if (validate()) {
      Get.to(MedicalCenter(screenlag, flag));
      Get.find<MedicalCenterController>().getDeliveryBoyTaskAPI(flag);
    }
  }

  bool validate() {
    if (selectedValue.pharmacyname == "Nearest Medical Center") {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("select_nearest_medical_center")}');

      return false;
    }

    return true;
  }

  void updateDropDown(Pharmacy.Result value) {
    selectedValue = value;
    AppConstants.PHARMACYID = value.pharmacyId;
    getTaskAPI();
    update();
    Get.forceAppUpdate();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2501));
    if (picked != null && picked != now) day.value = picked.day.toString();
    month.value = picked.month.toString();
    year.value = picked.year.toString();
    getTaskAPI();
    selectedDate.value = year.value + "/" + month.value + "/" + day.value;
  }

  updatePickUpDropDown(PickUpSelction result) {
    getTaskAPI();
    selectedValueTask.value = result;
    update();
    Get.forceAppUpdate();
  }

  void getTaskAPI() {
    getMyTaskApi(getPrefValue(Keys.DBOYID), selectedValue.pharmacyId,
            selectedDate.value, selectedValueTask.value.val.toString())
        .then((data) {
      if (data.success == "true") {
        // ignore: deprecated_member_use
        myTaskList.value = data.result;
        newCount.value = myTaskList.value.resultNew;
        pendingCount.value = myTaskList.value.pending;
        update();
      } else {
        newCount.value = 0;
        pendingCount.value = 0;
      }
    });
  }
}

class PickUpSelction {
  String title;
  int val;

  PickUpSelction({this.title, this.val});
}
