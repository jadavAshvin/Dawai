import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/CustomerController/orderDetailsController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:intl/intl.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/OrderStatusView.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:android_intent/android_intent.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class OrderDetails extends StatefulWidget {
  final String screenName;
  final int screenlag;
  final String invoiceNo;
  OrderDetails(this.screenlag, this.invoiceNo, this.screenName);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderDetailsController orderDerailsController =
      Get.put(OrderDetailsController());
  int ticks;

  String selectedDate = "";

  var addressVal, building, apartment, way, street, city, gov;

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   orderDerailsController.OrderDetailsAPI(widget.invoiceNo);
    //  addressVal = orderDerailsController.address.value.isEmpty ? "" : "${orderDerailsController.address.value},";
    //  building = orderDerailsController.house_building.value.isEmpty ? "" : "${orderDerailsController.house_building.value} ";
    //  apartment = orderDerailsController.appartment_number.value.isEmpty ? "" : "${orderDerailsController.appartment_number.value}, ";
    //  way = orderDerailsController.way_number.value.isEmpty ? "" : "${orderDerailsController.way_number.value}, ";
    //  street = orderDerailsController.street_name.value.isEmpty ? "" : "${orderDerailsController.street_name.value}, ";
    //  city = orderDerailsController.city.value.isEmpty ? "" : "${orderDerailsController.city.value}, ";
    //  gov = orderDerailsController.governorate.value.isEmpty ? "" : "${orderDerailsController.governorate.value}";

    // });
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM//yyyy');
    orderDerailsController.OrderDetailsAPI(widget.invoiceNo);
    return DirectionalWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () {
            AppConstants.HOME_CLICK = "";
            Get.back();
            //  screenlag == 0 ? Get.find<HomeContentController>().callOrderListAPI() : Get.find<HomeContentController>().searchDeliveryListByQuery();
          },
          child: BackgroundWidget(
            child: ListView(
              children: [
                appBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                  child: widget.screenlag == 0
                      ? Obx(() {
                          print(
                              "orderDerailsController.appartment_number.value ${orderDerailsController.appartment_number.value}");
                          addressVal = orderDerailsController.address.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.address.value},";
                          building = orderDerailsController.house_building.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.house_building.value},";
                          apartment = orderDerailsController
                                  .appartment_number.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.appartment_number.value},";
                          way = orderDerailsController.way_number.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.way_number.value},";
                          street = orderDerailsController.street_name.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.street_name.value},";
                          city =
                              orderDerailsController.city.value.trim().isEmpty
                                  ? ""
                                  : "${orderDerailsController.city.value},";
                          gov = orderDerailsController.governorate.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.governorate.value}";
                          if (orderDerailsController.created_date.isNotEmpty) {
                            selectedDate = orderDerailsController.created_date
                                    .split("-")[2] +
                                "/" +
                                orderDerailsController.created_date
                                    .split("-")[1] +
                                "/" +
                                orderDerailsController.created_date
                                    .split("-")[0];
                          }
                          String orderDate = "";
                          if (orderDerailsController.order_status_id.value ==
                              "4") {
                            orderDate = getLabel("on") +
                                " " +
                                orderDerailsController.dilvery_Date.value +
                                " " +
                                orderDerailsController.dilvery_time.value;
                          }
                          //utf8.decode(title.codeUnits)
                          print("building is ${building}");
                          return orderDerailsController.invoiceno.isEmpty
                              ? Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: CircularProgressIndicator()))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    setView(getLabel("order_no") +
                                        " : ${orderDerailsController.invoiceno}"),
                                    setView(getLabel("order_date") +
                                        " : $selectedDate"),
                                    setView(getLabel("mrn_no") +
                                        " : ${utf8.decode(orderDerailsController.mrn_no.codeUnits)}"),
                                    setView(getLabel("mobile_no") +
                                        " : ${orderDerailsController.mobile_no}"),
                                    setView(getLabel("nearest_med_center") +
                                        " : ${utf8.decode(orderDerailsController.nearest_med_center.codeUnits)}"),
                                    setView(getLabel("delivery_address") +
                                        ": " +
                                        utf8.decode(addressVal.codeUnits) +
                                        utf8.decode(way.codeUnits) +
                                        utf8.decode(building.codeUnits) +
                                        utf8.decode(apartment.codeUnits) +
                                        utf8.decode(street.codeUnits) +
                                        utf8.decode(city.codeUnits) +
                                        utf8.decode(gov.codeUnits)),
                                    // setView(getLabel("on") + ": ${dateFormat.format(DateTime.parse(orderDerailsController.order_delivery_Date.value))}"),
                                    customerContent(
                                        Pref.getString(Pref.IS_ENGLISH) == "0"
                                            ? orderDerailsController
                                                    .order_status_name
                                                    .toString() +
                                                " " +
                                                orderDate
                                            : utf8.decode(orderDerailsController
                                                    .order_status_arabic
                                                    .codeUnits) +
                                                " " +
                                                orderDate,
                                        orderDerailsController.color_code
                                            .toString()),

                                    orderDerailsController.not_del_content != ""
                                        ? setView(getLabel("status_message") +
                                            " : ${orderDerailsController.not_del_content}")
                                        : Container(),
                                    widget.screenName == "MediacalCenter"
                                        ? Container()
                                        : setView(getLabel("order_pin") +
                                            " : ${orderDerailsController.order_pin}"),
                                    Container(),

                                    Center(
                                      child: Text(
                                        getLabel("order_status_heading"),
                                        style: textFieldTextStyle(16, black),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: black,
                                    ),

                                    TimelineDelivery(
                                      screenlag: widget.screenlag,
                                    ),
                                    //  setDeliveryStatusView(context),
                                  ],
                                );
                        })
                      : Obx(() {
                          if (orderDerailsController.created_date.isNotEmpty) {
                            selectedDate = orderDerailsController.created_date
                                    .split("-")[2] +
                                "/" +
                                orderDerailsController.created_date
                                    .split("-")[1] +
                                "/" +
                                orderDerailsController.created_date
                                    .split("-")[0];
                          }
                          addressVal = orderDerailsController.address.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.address.value},";
                          building = orderDerailsController.house_building.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.house_building.value},";
                          apartment = orderDerailsController
                                  .appartment_number.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.appartment_number.value},";
                          way = orderDerailsController.way_number.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.way_number.value},";
                          street = orderDerailsController.street_name.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.street_name.value},";
                          city =
                              orderDerailsController.city.value.trim().isEmpty
                                  ? ""
                                  : "${orderDerailsController.city.value},";
                          gov = orderDerailsController.governorate.value
                                  .trim()
                                  .isEmpty
                              ? ""
                              : "${orderDerailsController.governorate.value}";

                          String orderDate = "";
                          if (orderDerailsController.order_status_id.value ==
                              "4") {
                            print("innnnnn");
                            orderDate = getLabel("on") +
                                " " +
                                orderDerailsController.dilvery_Date.value +
                                " " +
                                orderDerailsController.dilvery_time.value;
                          }
                          print(orderDerailsController.orderStatusLogResult);
                          print("stasssss ${orderDate}");
                          return orderDerailsController.invoiceno.isEmpty
                              ? Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: CircularProgressIndicator()))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    setView(getLabel("order_no") +
                                        " : ${orderDerailsController.invoiceno}"),
                                    setView(getLabel("national_id") +
                                        " : ${orderDerailsController.national_id}"),
                                    setView(getLabel("order_date") +
                                        " : ${selectedDate}"),
                                    setView(getLabel("mrn_no") +
                                        " : ${utf8.decode(orderDerailsController.mrn_no.codeUnits)}"),
                                    setView(getLabel("mobile_no") +
                                        " : ${orderDerailsController.mobile_no}"),
                                    setView(getLabel("nearest_med_center") +
                                        " : ${orderDerailsController.nearest_med_center}"),
                                    setView(getLabel("delivery_address") +
                                        ": " +
                                        utf8.decode(addressVal.codeUnits) +
                                        utf8.decode(way.codeUnits) +
                                        utf8.decode(building.codeUnits) +
                                        utf8.decode(apartment.codeUnits) +
                                        utf8.decode(street.codeUnits) +
                                        utf8.decode(city.codeUnits) +
                                        utf8.decode(gov.codeUnits)),

                                    //  setView(getLabel("delivery_address") + ": " + addressVal + way + building + apartment + street + city + gov),
                                    customerContent(
                                        Pref.getString(Pref.IS_ENGLISH) == "0"
                                            ? orderDerailsController
                                                    .order_status_name
                                                    .toString() +
                                                " " +
                                                orderDate
                                            : utf8.decode(orderDerailsController
                                                    .order_status_arabic
                                                    .codeUnits) +
                                                orderDate,
                                        orderDerailsController.color_code
                                            .toString()),
                                    orderDerailsController.not_del_content != ""
                                        ? setView(getLabel("status_message") +
                                            " : ${orderDerailsController.not_del_content}")
                                        : Container(),
                                    Center(
                                      child: Text(
                                        getLabel("order_status_heading"),
                                        style: textFieldTextStyle(16, black),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: black,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TimelineDelivery(
                                      screenlag: widget.screenlag,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    orderDerailsController
                                                .order_status_id.value ==
                                            "3"
                                        ? driverContent(context)
                                        : Container(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                        }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget setView(String title) {
    //  print("file no is ${title}");
    //  var ss = utf8.decode(title.codeUnits);

    // print("utf view ${ss}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textFieldTextStyle(16, black),
        ),
        Divider(
          thickness: 0.5,
          color: black,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("order_details"),
        style: textFieldTextBoldStyle(20, black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
            color: Pref.getString(Pref.IS_ENGLISH) == "0"
                ? Colors.white
                : Colors.red),
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {})
      ],
    );
  }

  Color colorConvert(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      return Color(int.parse("0x" + color));
    }
  }

  Widget customerContent(String name, String colorCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${getLabel("status")} : " + name,
          style: TextStyle(
              fontSize: 18,
              color: colorConvert(colorCode),
              fontWeight: FontWeight.bold),
        ),
        Divider(
          thickness: 0.5,
          color: black,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget driverContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.toWidth(),
        ),
        statusView(context),
        SizedBox(
          height: 10.toWidth(),
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            Images.MAP_IMAGE,
            height: 120.toWidth(),
          ),
        ),
        SizedBox(
          height: 30.toWidth(),
        ),
        CustomButton(getLabel("get_direction"), () async {
          String origin =
              "${getPrefValue(Keys.USER_LOCATION)}"; // lat,long like 123.34,68.56
          String destination = "${orderDerailsController.lat_long.value}";
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
            String url = "https://www.google.com/maps/dir/?api=1&origin=" +
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

          /*   print("lat longgg ${orderDerailsController.lat_long.value}");
            if(orderDerailsController.order_status_name=="In Transit"){
              Get.to(MapScreen(screenlag,
                  orderDerailsController.lat_long.value,
                  orderDerailsController.invoiceno.value,
                  orderDerailsController.order_status_name.value,
                  orderDerailsController.color_code.value,
                  orderDerailsController.order_pin.value,0
              ));
            }*/
        }),
      ],
    );
  }

  Widget statusView(BuildContext context) {
    return Column(
      //  mainAxisSize: MainAxisSize.min,
      //    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        orderDerailsController.order_status_name.value == "Not Delivered" ||
                orderDerailsController.order_status_name.value ==
                    "Order Delivered"
            ? Container()
            /*: widget.notShowlag == 1
            ? Container()*/
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    child: RaisedButton(
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        showAlterDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          getLabel("order_delivered"),
                          style: textFieldTextBoldStyle(15, white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 40,
                    child: RaisedButton(
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Get.defaultDialog(
                          middleText: getLabel("not_delivered"),
                          content: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    orderDerailsController.updateOrderStatus(
                                        orderDerailsController.invoiceno.value,
                                        "5",
                                        getLabel("not_del_1"));
                                    Get.back();
                                  },
                                  child: Card(
                                    margin: EdgeInsets.all(5),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(getLabel("not_del_1"),
                                          style: textFieldTextStyle(16, black)),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    orderDerailsController.updateOrderStatus(
                                        orderDerailsController.invoiceno.value,
                                        "5",
                                        getLabel("not_del_2"));
                                    Get.back();
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(getLabel("not_del_2"),
                                          style: textFieldTextStyle(16, black)),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    orderDerailsController.updateOrderStatus(
                                        orderDerailsController.invoiceno.value,
                                        "5",
                                        getLabel("not_del_3"));
                                    Get.back();
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(getLabel("not_del_3"),
                                          style: textFieldTextStyle(16, black)),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    orderDerailsController.updateOrderStatus(
                                        orderDerailsController.invoiceno.value,
                                        "5",
                                        getLabel("not_del_4"));
                                    Get.back();
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(getLabel("not_del_4"),
                                          style: textFieldTextStyle(16, black)),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    orderDerailsController.updateOrderStatus(
                                        orderDerailsController.invoiceno.value,
                                        "5",
                                        getLabel("not_del_5"));
                                    Get.back();
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(getLabel("not_del_5"),
                                          style: textFieldTextStyle(16, black)),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          confirm: Card(
                            elevation: 5,
                            child: FlatButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(getLabel("cancel"))),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          getLabel("not_delivered"),
                          style: textFieldTextBoldStyle(15, white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
      ],
    );
  }

  Widget setDeliveryStatusView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        tick1(),
        spacer(),
        line(),
        spacer(),
        tick2(),
        spacer(),
        line(),
        spacer(),
        tick3(),
        spacer(),
        line(),
        spacer(),
        tick4(),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            color: Colors.blue,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.grey,
          );
  }

  Widget tick1() {
    return 1 > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return 2 > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return 0 > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return 0 > 3 ? tick(true) : tick(false);
  }

  Widget spacer() {
    return Container(
      width: 2.0,
    );
  }

  Widget line() {
    return Container(
      color: Colors.blue,
      height: 3.0,
      width: double.infinity,
    );
  }

  void showAlterDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //  title: Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {},
              controller: orderDerailsController.orderPinController,
              decoration:
                  InputDecoration(hintText: getLabel("enter_order_pin")),
            ),
            actions: <Widget>[
              FlatButton(
                color: buttonColor,
                textColor: Colors.white,
                child: Text(getLabel("save")),
                onPressed: () {
                  if (orderDerailsController.order_pin.value ==
                      orderDerailsController.orderPinController.text) {
                    Get.back();
                    orderDerailsController.updateOrderStatus(
                        orderDerailsController.invoiceno.value, "4", "");
                    orderDerailsController.orderPinController.clear();
                  } else {
                    mySnackbar(
                        title: '${getLabel("error")}',
                        description: getLabel("enter_valid_pin"));

                    //
                  }
                },
              ),
              FlatButton(
                color: buttonColor,
                textColor: Colors.white,
                child: Text(getLabel("cancel")),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }
}
