import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomeScreens/orderDetails.dart';
import 'package:dawey/Screens/DeliveryBoyController/medicalCenterController.dart';
import 'package:dawey/Screens/DeliveryBoyController/myTaskController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/imageView.dart';
import 'package:dawey/Widget/progressBar.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:android_intent/android_intent.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class MedicalCenter extends StatelessWidget {
  final MedicalCenterController medicalCenterController =
      Get.put(MedicalCenterController());
  final int visibleFlag;
  final String flag;
  MedicalCenter(this.visibleFlag, this.flag);
  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Scaffold(
        body: BackgroundWidget(
          child: ListView(
            children: [
              appBar(),
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 60.0.toHeight()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getLabel("Pick Up"),
                      style: textFieldTextBoldStyle(18, black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    /*  Text(
                      "Date : 10/10/2020",
                      style: textFieldTextStyle(16, black),
                    ),*/
                    SizedBox(
                      height: 30,
                    ),
                    setRadioBottonView(context),
                    /*  visibleFlag == 1
                        ? Container()
                        : Center(
                            child: CustomButton(txtNext, () {
                            Get.to(Home(1));
                          })),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("new_task"),
        style: textFieldTextBoldStyle(25, black),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
            color: Pref.getString(Pref.IS_ENGLISH) == "0"
                ? Colors.white
                : Colors.red),
        onPressed: () {
          Get.find<MyTaskController>().getTaskAPI();
          Get.back();
        },
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            })
      ],
    );
  }

  Widget setRadioBottonView(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            Radio(
              value: 1,
              groupValue: medicalCenterController.pending.value,
              onChanged: (value) {
                medicalCenterController.pending.value = 1;
                medicalCenterController.pickUp.value = 0;
              },
            ),
            Text(
              getLabel("new"),
              style: textFieldTextBoldStyle(18, black),
            ),
            SizedBox(
              width: 20,
            ),
            Radio(
              value: 2,
              groupValue: medicalCenterController.pickUp.value,
              onChanged: (value) {
                medicalCenterController.pickUp.value = 2;
                medicalCenterController.pending.value = 0;
              },
            ),
            Text(
              getLabel("picked_up"),
              style: textFieldTextBoldStyle(18, black),
            ),
          ]),
          medicalCenterController.pending.value == 1
              ? pendingView()
              : pickUpView(),
        ],
      );
    });
  }

  Widget pickUpView() {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(() {
          // ignore: invalid_use_of_protected_member
          return medicalCenterController.pickupResult.value == null
              ? ProgressCircule()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: medicalCenterController.pickupResult.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return pickUpItem(index);
                  });
        }));
  }

  Widget pickUpItem(index) {
    var pickup = medicalCenterController.pickupResult[index];
    print("name is ${pickup['pharmacy_name']}");
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  child: Text(
                    pickup['invoice_no'],
                    style: textFieldTextStyle(16, black),
                  ),
                ),
                SizedBox(
                  width: 8.toWidth(),
                ),
                Expanded(
                  child: Text(
                    pickup['pharmacyname'].isNull
                        ? " "
                        : pickup['pharmacyname'],
                    style: textFieldTextStyle(16, black),
                  ),
                ),
                SizedBox(
                  width: 10.toWidth(),
                ),
                Expanded(
                  child: Text(
                    getLabel("yes"),
                    style: textFieldTextStyle(16, black),
                  ),
                ),
                Container(
                  width: 22,
                  height: 22,
                ),
                //ImageView(Images.IC_PIN, 22, 22)
              ],
            ),
            Divider(
              thickness: 0.5,
              color: black,
            ),
          ],
        ),
      ),
    );
  }

  Widget pendingView() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: medicalCenterController.pendingPickupResult.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return pendingItem(index);
          }),
    );
  }

  Widget pendingItem(index) {
    var pendingPickup = medicalCenterController.pendingPickupResult[index];
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pendingPickup['invoice_no'],
                style: textFieldTextStyle(16, black),
              ),
              SizedBox(
                width: 8.toWidth(),
              ),
              Flexible(
                child: Text(
                  pendingPickup['pharmacyname'] == null
                      ? " "
                      : pendingPickup['pharmacyname'],
                  style: textFieldTextStyle(16, black),
                ),
              ),
              SizedBox(
                width: 8.toWidth(),
              ),
              Container(
                width: 50,
                height: 25,
                child: RaisedButton(
                  color: buttonColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onPressed: (){
                    Get.defaultDialog(
                      middleText: getLabel("do_you_Want_to_pickup"),
                      title: getLabel("Pick Up"),
                      cancel: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            getLabel("no"),
                          )),
                      confirm: FlatButton(
                          onPressed: () {
                            medicalCenterController.updateOrderStatus(
                                pendingPickup['invoice_no'], "3", flag);
                            //Get.to(OrderDetails(visibleFlag, pendingPickup['invoice_no']));
                            Get.back();
                          },
                          child: Text(getLabel("yes"))),
                    );
                  },
                  child: Text(
                    getLabel("no"),
                    style: textFieldTextBoldStyle(13, white),
                  ),
                ),
              ),
             /* InkWell(
                onTap: () {
                  Get.defaultDialog(
                    middleText: getLabel("do_you_Want_to_pickup"),
                    title: getLabel("Pick Up"),
                    cancel: FlatButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          getLabel("no"),
                        )),
                    confirm: FlatButton(
                        onPressed: () {
                          medicalCenterController.updateOrderStatus(
                              pendingPickup['invoice_no'], "3", flag);
                          //Get.to(OrderDetails(visibleFlag, pendingPickup['invoice_no']));
                          Get.back();
                        },
                        child: Text(getLabel("yes"))),
                  );
                },
                child: Text(
                  getLabel("no"),
                  style: textFieldTextStyle(16, black),
                ),
              ),*/
              InkWell(
                  onTap: () async {
                    String origin =
                        "${getPrefValue(Keys.USER_LOCATION)}"; // lat,long like 123.34,68.56
                    String destination = "${pendingPickup['lat_long']}";
                    if (Platform.isAndroid) {
                      final AndroidIntent intent = new AndroidIntent(
                          action: 'action_view',
                          data: Uri.encodeFull(
                              "https://www.google.com/maps/dir/?api=1&origin=" +
                                  origin +
                                  "&destination=" +
                                  destination +
                                  "&travelmode=driving&dir_action=navigate"),
                          package: 'com.google.android.apps.maps');
                      intent.launch();
                    } else {
                      String url =
                          "https://www.google.com/maps/dir/?api=1&origin=" +
                              origin +
                              "&destination=" +
                              destination +
                              "&travelmode=driving&dir_action=navigate";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                    /*  Get.to(MapScreen(
                        1,
                        pendingPickup['lat_long'],
                        pendingPickup['invoice_no'],
                        pendingPickup['order_status_name'],
                        pendingPickup['color_code'],
                        pendingPickup['order_pin'],
                        1));*/
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 1, top: 1),
                    child: ImageView(Images.IC_PIN, 22, 22),
                  ))
            ],
          ),
          Divider(
            thickness: 0.5,
            color: black,
          ),
        ],
      ),
    );
  }
}
