import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

mySnackbar({String title, String description}) {
  return Get.snackbar(title, description,
      backgroundColor: Colors.red[100], snackPosition: SnackPosition.TOP);
}

Future<bool> snackBarBack({String title, String description}) async {
  Get.snackbar(title, description,
      backgroundColor: grey,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2));
  bool res = await Future.delayed(Duration(seconds: 2)).then((value) => true);
  return res;
}
