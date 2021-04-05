import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/pharmacyResponse.dart' as Pharmacy;
import 'package:dawey/Screens/Comman/home.dart';
import 'package:dawey/Screens/CustomerController/HomeController/home_content_controller.dart';
import 'package:dawey/Screens/DeliveryBoyController/myTaskController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/divider.dart';
import 'package:dawey/Widget/imageView.dart';
import 'package:dawey/Widget/progressBar.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTask extends StatefulWidget {
  int visibleFlag;

  MyTask(this.visibleFlag);

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  MyTaskController myTaskController = Get.put(MyTaskController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Scaffold(
        body: BackgroundWidget(
          child: ListView(
            children: [
              appBar(),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 60.0.toHeight()),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    selectMedicalCenterView(context),
                    SizedBox(
                      height: 12.0.toHeight(),
                    ),
                    //setDateView(context),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 60),
                    //   child: Divider(
                    //     thickness: 0.5,
                    //     color: black,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 12.0.toHeight(),
                    // ),
                    // pendingPickupDropDownView(context),
                    SizedBox(
                      height: 60,
                    ),
                    Obx(() {
                      print("pending is ${myTaskController.pendingCount.value}");
                      return InkWell(
                        onTap: () {
                          AppConstants.HOME_CLICK = "1";
                          Get.find<HomeContentController>().searchDeliveryListByQuery("3");
                          Get.to(Home(1));

                          // myTaskController.smbContinue(0, '2');
                        },
                        child: Container(
                          height: 80.0.toHeight(),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.all(Radius.circular(1)), // set rounded corner radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getLabel("pending"),
                                  style: textFieldTextStyle(45, red),
                                ),
                                Text(
                                  "${myTaskController.pendingCount.value}",
                                  style: textFieldTextStyle(45, red),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          myTaskController.smbContinue(0, '0');
                        },
                        child: Container(
                          height: 80.0.toHeight(),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.all(Radius.circular(1)), // set rounded corner radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getLabel("new"),
                                  style: textFieldTextStyle(45, red),
                                ),
                                Text(
                                  "${myTaskController.newCount.value}",
                                  style: textFieldTextStyle(45, red),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 50,
                    ),
                    /*   CustomButton(getLabel("continue"), () {
                      myTaskController.smbContinue(0, '0');
                    }),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectMedicalCenterView(BuildContext context) {
    return Obx(
      () {
        return myTaskController.selectedValue == null
            ? ProgressCircule()
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: DropdownButton<Pharmacy.Result>(
                      iconSize: 30.0.toHeight(),
                      iconEnabledColor: red,
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text(
                        myTaskController.selectedValue == null ? "" :
                        Pref.getString(Pref.IS_ENGLISH) == "0"
                            ? myTaskController.selectedValue.pharmacyname
                            : myTaskController.selectedValue.pharmacynameAb,
                        style: textFieldTextStyle(16, black),
                      ),
                      items: myTaskController.phararmacyList.map((Pharmacy.Result value) {
                        return new DropdownMenuItem<Pharmacy.Result>(
                          value: value,
                          child: Text(
                            Pref.getString(Pref.IS_ENGLISH) == "0"
                                ? value.pharmacyname
                                : value.pharmacynameAb,
                            style: TextStyle(color: black),
                          ),
                        );
                      }).toList(),
                      onChanged: (Pharmacy.Result value) {
                        myTaskController.updateDropDown(value);
                        //  setState(() {});
                      },
                    ),
                  ),
                  divider(),
                ],
              );
      },
    );
  }

  Widget pendingPickupDropDownView(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Container(
            width: double.infinity,
            child: DropdownButton<PickUpSelction>(
              iconSize: 30.0.toHeight(),
              iconEnabledColor: red,
              underline: SizedBox(),
              isExpanded: true,
              hint: Text(
                myTaskController.selectedValue == null ? "" : myTaskController.selectedValueTask.value.title,
                style: textFieldTextStyle(16, black),
              ),
              items: myTaskController.pickupSelection.map((PickUpSelction value) {
                return new DropdownMenuItem<PickUpSelction>(
                  value: value,
                  child: Text(
                    value.title,
                    style: TextStyle(color: black),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                myTaskController.selectedValueTask.value = _;
                myTaskController.filterMonth.value = _.val;
                myTaskController.updatePickUpDropDown(_);
              },
            ),
          );
        }),
        Divider(
          thickness: 0.5,
          color: black,
        )
      ],
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("my_task"),
        style: textFieldTextBoldStyle(25, black),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Pref.getString(Pref.IS_ENGLISH) == "0" ? Colors.white : Colors.red),
        onPressed: () => Get.offAll(Home(1)),
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

  Widget setDateView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          return Text(
            myTaskController.day.value == "" ? "DD/MM/YYYY" : "${myTaskController.day.value}" + " / " + "${myTaskController.month.value}" + " / " + myTaskController.year.value,
            style: textFieldTextStyle(16, black),
          );
        }),
        InkWell(
            onTap: () {
              myTaskController.selectDate(context);
              setState(() {});
            },
            child: ImageView(Images.IC_CALENDAR, 40, 40)),
      ],
    );
  }

  Widget pendingPickUpView(BuildContext context, String title, String order) {
    return Container(
      height: 80.0.toHeight(),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.all(Radius.circular(1)), // set rounded corner radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textFieldTextStyle(45, red),
            ),
            Text(
              order,
              style: textFieldTextStyle(45, red),
            )
          ],
        ),
      ),
    );
  }
}
