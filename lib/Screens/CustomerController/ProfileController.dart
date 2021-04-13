import 'dart:convert';
import 'dart:io';
import 'package:dawey/Models/getProfile.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/otpView.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Models/cityName.dart';
import 'package:dawey/Models/cityName.dart' as City;
import 'package:dawey/Screens/CustomeScreens/myOrder.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawey/Utils/mySnackbar.dart';

class ProfileController extends GetxController {
  var isChecked = false.obs;
  final FocusNode focus = FocusNode();
  var isLoading = false.obs;
  var verifyFlag = "".obs;
  File image;
 // var natimageUploaded = false.obs;
  File profileImage;
  var privacyColor = false.obs;
  var city = "".obs;
  GetProfileResponse getProfileResponse = GetProfileResponse();

  TextEditingController nationalIdController =
      TextEditingController(text: AppConstants.NATIONALID);
  TextEditingController mrnNoController =
      TextEditingController(text: AppConstants.MRNNO);
  TextEditingController addCommentController = TextEditingController();
  TextEditingController nameController =
      TextEditingController(text: AppConstants.NAME);
  TextEditingController lastNameController =
      TextEditingController(text: AppConstants.LASTNAME);
  TextEditingController mobileNoController =
      TextEditingController(text: getPrefValue(Keys.MOBILE));
  TextEditingController emailController =
      TextEditingController(text: getPrefValue(Keys.EMAIL));
  TextEditingController deliveryAddressController =
      TextEditingController(text: AppConstants.DELIVERYADDRESS);
  TextEditingController wayNoController =
      TextEditingController(text: AppConstants.WAYNO);
  TextEditingController streetNameController =
      TextEditingController(text: AppConstants.STREETNAME);
  TextEditingController buildingController =
      TextEditingController(text: AppConstants.BUILDING);
  TextEditingController plotNoController =
      TextEditingController(text: AppConstants.PLOTNO);
  TextEditingController governorateController =
      TextEditingController(text: getLabel("muscat"));
  TextEditingController wilayatController = TextEditingController();
  TextEditingController nearestLandmarkController =
      TextEditingController(text: AppConstants.NEARESTLANDMARK);

  // ignore: deprecated_member_use
  var cityList = List<Result>().obs;

  City.Result selectedValue = City.Result(
      id: "0",
      name: getLabel("select_vilayat"),
      abName: getLabel("select_vilayat"));

  bool validate(screenName) {
   /* if (nationalIdController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("national_Id_required")}');
      return false;
    } */
      print("nation id legth  is ${nationalIdController.text.length}");
    if(nationalIdController.text.length<7 || nationalIdController.text.length>10 ){
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("national_id_limit")}');
      return false;
    }
  /*  if (image == null && screenName != "home") {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("upload_national_id")}');
      return false;
    }*/
    if (mrnNoController.text.length<4 ||mrnNoController.text.length>8) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("file_limit")}');
      return false;
    }/*  if (mrnNoController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("mRN_No_required")}');
      return false;
    }*/
    if (nameController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("name_required")}');
      return false;
    }
    if (mobileNoController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("mobile_No_required")}');
      return false;
    }
    if (emailController.text.isEmail == false &&
        emailController.text.isNotEmpty) {
      mySnackbar(title: 'Invalid', description: 'Email is Invalid');
      return false;
    }

    if (buildingController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("building_villa_required")}');
      return false;
    }
   /* if (plotNoController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("plot_No_required")}');
      return false;
    }*/
    if (deliveryAddressController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("delivery_address_required")}');
      return false;
    }
    if (wayNoController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("way_No_required")}');
      return false;
    }

    /*   if (streetNameController.text.isEmpty) {
      mySnackbar(
          title: '${getLabel("empty")}',
          description: '${getLabel("street_name_required")}');
      return false;
    }*/

    /*   if (governorateController.text.isEmpty) {
      mySnackbar(
          title: '${getLabel("empty")}',
          description: '${getLabel("governorate_required\r\n")}');
      return false;
    }*/
    if (selectedValue.name == "'Ibri" ||
        selectedValue.name == "Select Wilayat" ||
        selectedValue.name == "اختر ولاية") {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("wilayat_required")}');
      return false;
    }
    if (isChecked.value == false) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("privacy_policy_error")}');
      return false;
    }
    // if (nearestLandmarkController.text.isEmpty) {
    //   mySnackbar(title: '${getLabel("empty")}', description: '${getLabel("nearest_landmark_required\r\n")}');
    //   return false;
    // }

    return true;
  }

  @override
  void onInit() {
    super.onInit();
    // callCityNameAPI();
  }

  smbSave(int screenlag, String screen) {
    if (validate(screen)) {
      setPrefValue(
          Keys.NAME, '${nameController.text} ${lastNameController.text}');

      print("Iamge is $image");
      if (screen == "home") {
    //    updateProfile(screenlag);
      } else {
      //  callProfileAPI(screenlag);
        print("iffffffffffff");
        /* if (image == null && profileImage == null) {
          callProfileAPI(screenlag);
          print("iffffffffffff");

        } else {
          print("elseeeeeeeeeee");
          natimageUploaded(true);
          callProfileWithFile(screenlag);
        }*/
      }
    }
  }

  smbVerify(
    int screenlag,
  ) {}

  smbVerifyCLick(int screenlag) {
    callRegisterAPI();
  }

  void callRegisterAPI() {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(pattern);

    if (mobileNoController.text.isEmpty) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("mobile_No_required")}');
    } else if (!regExp.hasMatch(mobileNoController.text)) {
      mySnackbar(
          title: Pref.getString(Pref.IS_ENGLISH) == "0"
              ? '${getLabel("empty")}'
              : AppConstants.EMPTY_KEY,
          description: '${getLabel("mobile_No_required")}');
    } else {
      registerApi(mobileNoController.value.text,
              getPrefValue(Keys.REGISTER_LAT_LONG))
          .then((data) {
        isLoading.value = true;
        var response = json.decode(data.body);
        if (response['success'] == "true") {
          setPrefValue(
              Keys.NAME, '${nameController.text} ${lastNameController.text}');
          setPrefValue(
              Keys.CUSTOMERID, response['result']['customer_id'].toString());
          setPrefValue(Keys.MOBILE, response['result']['mobile_no'].toString());
          setPrefValue(Keys.OTP, response['result']['otp'].toString());
          isLoading.value = false;
          mySnackbar(
              title: '${getLabel("success")}',
              description: '${getLabel("mobile_exist")}');
          Get.to(OtpView(0, ""));
        } else {
          isLoading.value = false;
          mySnackbar(
              title: '${getLabel("error")}', description: response['result']);
        }
      });
    }
  }

  void callProfileAPI(int screenlag) {
    isLoading.value = true;
    var city = Pref.getString(Pref.IS_ENGLISH) == "0"
        ? selectedValue.name
        : selectedValue.abName;
    setPrefValue(
        Keys.NAME, '${nameController.text} ${lastNameController.text}');
    profileApi(
      nationalIdController.text,
      mrnNoController.text,
      nameController.text,
      lastNameController.text,
      deliveryAddressController.text,
      streetNameController.text,
      wayNoController.text,
      buildingController.text,
      plotNoController.text,
      city,
      governorateController.text,
      mobileNoController.text,
      emailController.text,
      nearestLandmarkController.text,
    ).then((data) {
      var response = json.decode(data.body);
      if (response['success'] == "true") {
        setProfileResponse();
        clearAllController();
        focus.unfocus();
        Get.to(MyOrder(screenlag, "home"));
        isLoading.value = false;
        mySnackbar(
            title: '${getLabel("success")}',
            description: getLabel("profile_updated"));
      } else {
        mySnackbar(
            title: '${getLabel("error")}', description: response['result']);
      }
    });
  }

  void updateProfile(int screenlag) {
    var city = Pref.getString(Pref.IS_ENGLISH) == "0"
        ? selectedValue.name
        : selectedValue.abName;
    isLoading.value = true;
    setPrefValue(
        Keys.NAME, '${nameController.text} ${lastNameController.text}');
    //if (image == null && profileImage == null) {
    print('simplet update');
    updateProfileApi(
            nationalId: nationalIdController.text,
            MRN: mrnNoController.text,
            firstName: nameController.text,
            lastName: lastNameController.text,
            address: deliveryAddressController.text,
            streetName: streetNameController.text,
            wayNumber: wayNoController.text,
            houseBuilding: buildingController.text,
            apprtment: plotNoController.text,
            city: city,
            governot: governorateController.text,
            mobileNo: mobileNoController.text,
            email_id: emailController.text,
            nearest: nearestLandmarkController.text,
            cid: getPrefValue(Keys.CUSTOMERID))
        .then((data) {
      var response = json.decode(data.body);
      if (response['success'] == "true") {
        setProfileResponse();
        setValuesToFields();
        clearAllController();
        focus.unfocus();
        Get.to(Home(0));
        isLoading.value = false;
        mySnackbar(
            title: '${getLabel("success")}',
            description: getLabel("profile_updated"));
      } else {
        mySnackbar(
            title: '${getLabel("error")}', description: response['result']);
      }
    });
    /* } else {
      print('update with file');


      updateProfileWithFileApi(  getParameters(), (data) {
        var response = json.decode(data);
        if (response['success'] == "true") {
          setProfileResponse();
          setValuesToFields();
          clearAllController();
          focus.unfocus();

          isLoading.value = false;
          mySnackbar(title: '${getLabel("success")}', description: response['result']);
        } else {
          mySnackbar(title: '${getLabel("error")}', description: response['result']);
        }
      });
    }*/
  }

  void callProfileWithFile(int screenlag) {
    isLoading.value = true;
    print("profile image is $profileImage");

    saveProfileWithFileApi(getParameters(), (data) {
      print("data is ${data}");
    });
  }

  setProfileResponse() {
    AppConstants.NATIONALID = nationalIdController.text;
    AppConstants.MRNNO = mrnNoController.text;
    AppConstants.DELIVERYADDRESS = deliveryAddressController.text;
    AppConstants.WAYNO = wayNoController.text;
    AppConstants.STREETNAME = streetNameController.text;
    AppConstants.BUILDING = buildingController.text;
    AppConstants.PLOTNO = plotNoController.text;
    AppConstants.GOVERNORATE = governorateController.text;
    AppConstants.NEARESTLANDMARK = nearestLandmarkController.text;
    print("nation id ddddd ${AppConstants.NATIONALID}");
  }

  callOnlyProfileImageApi(profileImage) {
    if (profileImage != null) {
      updatePROFILEIMAGE(profileImage, getParametersNationalId(), (data) {
        print("data is ${data}");
      });
    }
  }

  void callCityNameAPI() {
    getCityApi().then((data) {
      // ignore: deprecated_member_use
      cityList.value = data.result;
      //update();
    });
  }

  updateDropDown(City.Result result) {
    selectedValue = result;
    update();
  }

  updateCheckBox(check) {
    isChecked(check);
    update();
  }

  void cameraBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.camera),
                    title: Text(getLabel("camera"),
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.normal,
                            color: black,
                            fontSize: 18.0)),
                    onTap: () {
                      getImageFromCamera();
                    }),
                Center(
                  child: ListTile(
                    leading: Icon(Icons.image),
                    title: Text(getLabel("gallery"),
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.normal,
                            color: black,
                            fontSize: 18.0)),
                    onTap: () => getImageFromGallery(),
                  ),
                ),
                ListTile(
                  title: Center(
                      child: Text(getLabel("cancel"),
                          style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.normal,
                              color: black,
                              fontSize: 18.0))),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          );
        });
  }

  Future getImageFromCamera() async {
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    image = file;
    Get.forceAppUpdate();
    if (image != null) {
      //natimageUploaded(true);
      //updateNationalId(image, getParametersNationalId(), (data) {});
    }
    Get.back();
  }

  Future getImageFromGallery() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    image = file;
    Get.forceAppUpdate();
  //  natimageUploaded(true);
    if (image != null) {
    //  natimageUploaded(true);
    //  updateNationalId(image, getParametersNationalId(), (data) {});
    }
    update();
    Get.back();
  }

  getParametersNationalId() {
    return {'customer_id': '${getPrefValue(Keys.CUSTOMERID)}'};
  }

  getParameters() {
    setProfileResponse();
    var city = Pref.getString(Pref.IS_ENGLISH) == "0"
        ? selectedValue.name
        : selectedValue.abName;
    return {
      'national_id': '${nationalIdController.text}',
      'mrn_no': '${mrnNoController.text}',
      'firstname': '${nameController.text}',
      'lastname': '${lastNameController.text}',
      'address': '${deliveryAddressController.text}',
      'street_name': '${streetNameController.text}',
      'way_number': '${wayNoController.text}',
      'house_building': '${buildingController.text}',
      'appartment_number': '${plotNoController.text}',
      'city': '$city',
      'governorate': '${governorateController.text}',
      'mobile_no': '${mobileNoController.text}',
      'email_id': '${emailController.text}',
      'customer_id': '${getPrefValue(Keys.CUSTOMERID)}'
    };
  }

  void clearAllController() {
    nationalIdController.clear();
    mrnNoController.clear();
    nameController.clear();
    lastNameController.clear();
    deliveryAddressController.clear();
    streetNameController.clear();
    wayNoController.clear();
    buildingController.clear();
    plotNoController.clear();
    wilayatController.clear();
    mobileNoController.clear();
    emailController.clear();
    nearestLandmarkController.clear();
  }

  void setValuesToFields() async {
    Future.delayed(Duration(seconds: 3));
    getProfileResponse = await getProfiletApi(getPrefValue(Keys.CUSTOMERID));
    print(
        'from set value: ${getProfileResponse.getprofileresult[0].firstname}');
    var getprofile = getProfileResponse.getprofileresult[0];
    nationalIdController.text = getprofile.nationalId;
    mrnNoController.text = getprofile.mrnNo;
    nameController.text = getprofile.firstname;
    lastNameController.text = getprofile.lastname;
    deliveryAddressController.text = getprofile.address;
    streetNameController.text = getprofile.streetName;
    wayNoController.text = getprofile.wayNumber;
    buildingController.text = getprofile.houseBuilding;

    plotNoController.text = getprofile.appartmentNumber;

    City.Result cityRes = getprofile.city == ""
        ? City.Result(
            name: getLabel("select_vilayat"),
            abName: getLabel("select_vilayat"))
        : City.Result(name: getprofile.city, abName: getprofile.city);
    setPrefValue(Keys.IMG_URL, getprofile.profileImage);
    selectedValue = cityRes;
    // governorateController.text = getprofile.governorate;
    mobileNoController.text = getprofile.mobileNo;
    emailController.text = getprofile.emailId;
    nearestLandmarkController.text = getprofile.nearestLandmark;
    if (getprofile.privacyPolicyAgree == "1") {
      print("Privacy Check" + getprofile.privacyPolicyAgree);
      isChecked(true);
    }
  /*  if (getProfileResponse.getprofileresult[0].nationalIdFile.isEmpty) {
    //  natimageUploaded.value = false;
      update();
    } else {
     // natimageUploaded.value = true;
      update();

      Get.forceAppUpdate();
    }*/

    print(
        "national file is    ${getProfileResponse.getprofileresult[0].nationalIdFile}");
  }
}
