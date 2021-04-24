import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Screens/CustomerController/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  static   validateNationalId() {
    if (Get.find<ProfileController>().nationalIdController.text.length < 7 ||
        Get.find<ProfileController>().nationalIdController.text.length > 10)
      return '${getLabel("national_id_limit")}';
    else
      return null;
  }

  static String validateMRNNo() {
    if (Get.find<ProfileController>().mrnNoController.text.length < 4 || Get.find<ProfileController>().mrnNoController.text.length > 8)
      return '${getLabel("file_limit")}';
    else
      return null;
  }

  static String validateName() {
    if (Get.find<ProfileController>().nameController.text.isEmpty)
      return '${getLabel("file_limit")}';
    else
      return null;
  }

  static  String validateMobile() {
    if (Get.find<ProfileController>().mobileNoController.text.isEmpty)
      return '${getLabel("mobile_No_required")}';
    else
      return null;
  }

  static String validateEmail() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (Get.find<ProfileController>().emailController.text.isNotEmpty)
      return '${getLabel("email_required")}';
    else if (!regex.hasMatch(Get.find<ProfileController>().emailController.text))
      return '${getLabel("email_required")}';
    else
      return null;
  }

  static  String validateBuilding() {
    if (Get.find<ProfileController>().buildingController.text.isEmpty)
      return '${getLabel("building_villa_required")}';
    else
      return null;
  }

  static String validateDeliveryAddress() {
    if (Get.find<ProfileController>().deliveryAddressController.text.isEmpty)
      return '${getLabel("delivery_address_required")}';
    else
      return null;
  }

  static String validateWayNo() {
    if (Get.find<ProfileController>().wayNoController.text.isEmpty)
      return '${getLabel("way_No_required")}';
    else
      return null;
  }

}
