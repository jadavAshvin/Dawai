import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/getProfile.dart';
import 'package:dawey/Models/pharmacyModel.dart';
import 'package:dawey/Models/pharmacyResponse.dart' as Pharmacy;
import 'package:dawey/Screens/Comman/Profile.dart';
import 'package:dawey/Screens/CustomeScreens/thankYou.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawey/Utils/mySnackbar.dart';

class MyOrderController extends GetxController {
  var serviceISChecked = false.obs;
  var deliveryIsChecked = false.obs;
  final FocusNode focus = FocusNode();
  var mrnNo = "".obs;
  var addressResponse = "".obs;
  var isLoading = false.obs;
  // var selectedValue = PharmacyResult().obs;
  GetProfileResponse getProfileResponse = GetProfileResponse();
  List<PharmacyResult> pharmacy = List<PharmacyResult>();

  TextEditingController nationalIdController =
      TextEditingController(text: AppConstants.NATIONALID);
  TextEditingController mrnNoController =
      TextEditingController(text: AppConstants.MRNNO);
  TextEditingController addCommentController = TextEditingController();

  // var pofileDetails = List<GetProfileResponse>().obs;

  // ignore: deprecated_member_use
  var phararmacyList = List<Pharmacy.Result>().obs;
  Pharmacy.Result selectedValue = Pharmacy.Result(
      pharmacyId: "0",
      pharmacyname: getLabel("nearest_med_center"),
      pharmacynameAb: getLabel("nearest_med_center"),
      latLong: "0");

  // ignore: deprecated_member_use
  var profileDetails = List<GetProfileResult>().obs;

  @override
  void onInit() {
    super.onInit();
    //pharmacy.add(PharmacyResult(pharmacyname: 'Select Nearest Pharmacy'));
    getPharmacy();
  }

  bool validate() {
    if(AppConstants.NATIONALID==""){
      Get.to(Profile(0, 'otpView'));
      return false;
    }
    if (nationalIdController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("national_Id_required")}');
      return false;
    }
    if (mrnNoController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("mRN_No_required")}');
      return false;
    }
    if (deliveryIsChecked.value == false) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("select_del_add")}');
      return false;
    }
    if (selectedValue.pharmacyname == getLabel("nearest_med_center") ||
        selectedValue.pharmacyname == "All Health Center") {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("select_pharmacy_name")}');
      return false;
    }

    if (serviceISChecked.value == false) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("service_fee")}');
      return false;
    }

    return true;
  }

  void getPharmacy() async {
    getPharmacyApi().then((data) {
      // ignore: deprecated_member_use
      phararmacyList.value = data.result;
    });
    isLoading(false);
  }

  smbPlaceOrder(int screenlag) {
    if (validate()) {
      callOrderPlacedAPI(screenlag);
    }
  }

  void callOrderPlacedAPI(int screenlag) {

    getOrderlApi(
            getPrefValue(Keys.CUSTOMERID),
            selectedValue.pharmacyId,
            selectedValue.pharmacyname,
            AppConstants.MOBILENO,
            AppConstants.NATIONALID,
            AppConstants.MRNNO,
            AppConstants.FIRTSNAME,
            AppConstants.LASTNAME,
            AppConstants.DELIVERYADDRESS,
            AppConstants.STREETNAME,
            AppConstants.WAYNO,
            AppConstants.BUILDING,
            AppConstants.PLOTNO,
            AppConstants.City_Name,
            AppConstants.GOVERNORATE,
            addCommentController.text)
        .then((data) {
      if (data.success == "true") {
        AppConstants.ORDER_NO = data.result.orderNo;
        AppConstants.ORDER_DATE = data.result.orderDate.toString();
        Get.to(ThankYou(screenlag));
        mySnackbar(
            title: '${getLabel("success")}',
            description: getLabel("ordered_success"));
      } else {
        mySnackbar(
            title: '${getLabel("error")}', description: data.result.message);
      }
    });
  }

/*
  updateDropDown(Pharmacy.Result result) {
    selectedValue = result;
    update();
  }
*/

  void getProfilDetailseAPI() {
    getProfiletApi(getPrefValue(Keys.CUSTOMERID)).then((data) {
      if (data.success == "true") {
        profileDetails.value = data.getprofileresult;
        // getProfileResponse = data;
        var getProfile = profileDetails[0];
        nationalIdController.text = getProfile.nationalId;
        mrnNoController.text = getProfile.mrnNo;
        AppConstants.MOBILENO = getProfile.mobileNo;
        AppConstants.NATIONALID = getProfile.nationalId;
        AppConstants.MRNNO = getProfile.mrnNo;
        AppConstants.FIRTSNAME = getProfile.firstname;
        AppConstants.LASTNAME = getProfile.lastname;
        AppConstants.DELIVERYADDRESS = getProfile.address;
        AppConstants.STREETNAME = getProfile.streetName;
        AppConstants.WAYNO = getProfile.wayNumber;
        AppConstants.BUILDING = getProfile.houseBuilding;
        AppConstants.PLOTNO = getProfile.appartmentNumber;
        AppConstants.City_Name = getProfile.city;
        AppConstants.GOVERNORATE = getProfile.governorate;
        addressResponse.value = getProfile.address;
        //  setPrefValue(Keys.NATIONALI_FILE, getProfileResponse.getprofileresult[0].nationalIdFile);

      }
    });
    isLoading(false);
  }

  void getProfileDetailsAPI() {}

  void updateDropDown(Pharmacy.Result value) {
    selectedValue = value;
    update();
  }
}
