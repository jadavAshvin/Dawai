import 'package:dawey/Comman/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


IconButton iconsBotton(){
  return IconButton(
    icon: Icon(Icons.arrow_back, color: Pref.getString(Pref.IS_ENGLISH)=="0"?Colors.white:Colors.red),
    onPressed: () => Get.back(),
  );
}