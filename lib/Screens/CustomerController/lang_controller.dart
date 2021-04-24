import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/langResponse.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/loginOptions.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:get/get.dart';

class LangController extends GetxController {
  var isLoading = false.obs;

  callLangAPI(String code) async {
    isLoading.value = true;
    getLabelApi(code).then((LangData value) async {
      print("@@@@@@ ${value}");
      if (value != null) {
        for (int i = 0; i < value.language.length; i++) {
          await setLabel(value.language[i].key, value.language[i].value);
        }
      }
      await Pref.setString(Pref.IS_ENGLISH, code == "en" ? "0" : "1");
      if (getPrefValue(Keys.ROLE) != "") {
        if (getPrefValue(Keys.ROLE) == "0") {
          Get.offAll(Home(0)); //customer
        } else {
          Get.offAll(Home(1)); //delivery
        }
      } else {
        Get.offAll(LoginOptions());
        /*else if (getPrefValue(Keys.DBOYID) != "") {
        if (getPrefValue(Keys.ROLE) == "0") {
          Get.offAll(Home(0)); //customer
        } else {
          Get.offAll(Home(1)); //delivery
        }
      }*/
      }
      /*else {
        Get.offAll(LoginOptions()); //delivery
      }*/
    });
  }
}
