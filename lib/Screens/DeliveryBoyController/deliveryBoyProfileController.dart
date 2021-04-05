import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawey/Utils/mySnackbar.dart';

class DelvieryBoyProfileController extends GetxController {
  final FocusNode focus = FocusNode();

  TextEditingController nationalIdController = TextEditingController();
  TextEditingController mrnNoController = TextEditingController();
  TextEditingController addCommentController = TextEditingController();
  TextEditingController nameController = TextEditingController(text: getPrefValue(Keys.NAME));
  TextEditingController mobileNoController = TextEditingController(text: getPrefValue(Keys.MOBILE));
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController wayNoController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController plotNoController = TextEditingController();
  TextEditingController governorateController = TextEditingController();
  TextEditingController wilayatController = TextEditingController();
  TextEditingController nearestLandmarkController = TextEditingController();

  bool validate() {
    if (nationalIdController.text.isEmpty) {
      mySnackbar(title:Pref.getString(Pref.IS_ENGLISH)=="0"?'${getLabel("empty")}':AppConstants.EMPTY_KEY, description: 'National Id required');
      return false;
    }

    return true;
  }
}
