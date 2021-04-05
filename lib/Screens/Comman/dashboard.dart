import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/deliveryOrderListResponse.dart' as Delivery;
import 'package:dawey/Models/orderList.dart';
import 'package:dawey/Screens/CustomeScreens/orderDetails.dart';
import 'package:dawey/Screens/CustomerController/HomeController/home_content_controller.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:intl/intl.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/colorConvert.dart';
import 'package:dawey/Widget/divider.dart';
import 'package:dawey/Widget/imageView.dart';
import 'package:dawey/Widget/no_data_found.dart';
import 'package:dawey/Widget/progressBar.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Iconss;
import 'package:dawey/Models/orderStatusResponse.dart' as OrderStatus;

import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  final int screenlag;
  final screenName;
  Dashboard(this.screenlag, this.screenName);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeContentController>();
  }

  @override
  Widget build(BuildContext context) {
    // if (AppConstants.HOME_CLICK == "1") {
    //   Future.delayed(Duration(seconds: 0));
    //   Get.find<HomeContentController>().isLoading(true);
    //   Get.find<HomeContentController>().searchDeliveryListByQuery("3");
    // }
    print('role' + getPrefValue(Keys.ROLE));
    return widget.screenName == "dash"
        ? DirectionalWidget(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: BackgroundWidget(
                child: ListView(
                  children: [
                    AppBar(
                      elevation: 0.0,
                      title: Text(
                        getLabel("status"),
                        style: textFieldTextBoldStyle(25, black),
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        icon: Iconss.Icon(Icons.arrow_back,
                            color: Pref.getString(Pref.IS_ENGLISH) == "0"
                                ? Colors.white
                                : Colors.red),
                        onPressed: () => Get.back(),
                      ),
                      actions: [
                        IconButton(
                            icon: Iconss.Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: ImageView(Images.IC_DASH_IMAGE,
                                150.toWidth(), 150.toWidth())),
                        if(getPrefValue(Keys.DBOYID) != '')
                        setInputSearch(context),

                        selectOrderStatusView(context),
                        setDropDownLastSixMonth(context),
                        SizedBox(
                          height: 10.toHeight(),
                        ),
                        getPrefValue(Keys.DBOYID) == ''
                            ? Obx(() {
                                print(
                                    'from dashboard 1 ${Get.find<HomeContentController>().orderList}');

                                print(
                                    "all data ${Get.find<HomeContentController>().isLoading.value}");
                                print(
                                    "all isEmpty ${Get.find<HomeContentController>().orderList.isEmpty}");
                                return Get.find<HomeContentController>()
                                        .isLoading
                                        .value
                                    ? CircularProgressIndicator()
                                    : Get.find<HomeContentController>()
                                                    .orderList
                                                    .length ==
                                                0 ||
                                            Get.find<HomeContentController>()
                                                .orderList
                                                .isEmpty
                                        ? NoItemFound()
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: Get.find<
                                                    HomeContentController>()
                                                .orderList
                                                .length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return Obx(() => customerItem(
                                                  Get.find<
                                                          HomeContentController>()
                                                      .orderList[index]));
                                            });
                              })
                            : Obx(() {
                                print(
                                    'from dashboard 2 ${Get.find<HomeContentController>().orderList}');

                                return Get.find<HomeContentController>()
                                        .isLoading
                                        .value
                                    ? CircularProgressIndicator()
                                    : Get.find<HomeContentController>()
                                                    .deliveryList
                                                    .length ==
                                                0 ||
                                            Get.find<HomeContentController>()
                                                .deliveryList
                                                .isEmpty
                                        ? NoItemFound()
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: Get.find<
                                                    HomeContentController>()
                                                .deliveryList
                                                .length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return deliveryItem(Get.find<
                                                      HomeContentController>()
                                                  .deliveryList[index]);
                                            });
                              }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : DirectionalWidget(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: ImageView(Images.IC_DASH_IMAGE, 150.toWidth(),
                              150.toWidth())),
                      if(getPrefValue(Keys.DBOYID) != '')
                      setInputSearch(context),

                      AppConstants.HOME_CLICK == "1"
                          ? Container(
                              height: 10,
                            )
                          : Column(
                              children: [
                                selectOrderStatusView(context),
                                setDropDownLastSixMonth(context),
                              ],
                            ),
                      SizedBox(
                        height: 10.toHeight(),
                      ),
                      getPrefValue(Keys.DBOYID) == ''
                          ? Obx(() {
                              print(
                                  'from dashboard 3 ${Get.find<HomeContentController>().orderList}');

                              print(
                                  "all data ${Get.find<HomeContentController>().isLoading.value}");
                              print(
                                  "all isEmpty ${Get.find<HomeContentController>().orderList.isEmpty}");
                              return Get.find<HomeContentController>()
                                      .isLoading
                                      .value
                                  ? CircularProgressIndicator()
                                  : Get.find<HomeContentController>()
                                                  .orderList
                                                  .length ==
                                              0 ||
                                          Get.find<HomeContentController>()
                                              .orderList
                                              .isEmpty
                                      ? NoItemFound()
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              Get.find<HomeContentController>()
                                                  .orderList
                                                  .length,
                                          itemBuilder:
                                              (BuildContext ctxt, int index) {
                                            return Obx(() => customerItem(
                                                Get.find<
                                                        HomeContentController>()
                                                    .orderList[index]));
                                          });
                            })
                          : Obx(() {
                              print(
                                  'from dashboard 4 ${Get.find<HomeContentController>().orderList}');
                              return Get.find<HomeContentController>()
                                      .isLoading
                                      .value
                                  ? CircularProgressIndicator()
                                  : Get.find<HomeContentController>()
                                                  .deliveryList
                                                  .length ==
                                              0 ||
                                          Get.find<HomeContentController>()
                                              .deliveryList
                                              .isEmpty
                                      ? NoItemFound()
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              Get.find<HomeContentController>()
                                                  .deliveryList
                                                  .length,
                                          itemBuilder:
                                              (BuildContext ctxt, int index) {
                                            return deliveryItem(Get.find<
                                                    HomeContentController>()
                                                .deliveryList[index]);
                                          });
                            }),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("all_order_status"),
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            icon: Iconss.Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {})
      ],
    );
  }

  Widget selectOrderStatusView(BuildContext context) {
    return Obx(
      () {
        return Get.find<HomeContentController>().selectedStatusValue == null
            ? ProgressCircule()
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 0),
                    width: double.infinity,
                    transform: Matrix4.translationValues(00, 10, 00),
                    child: DropdownButton<OrderStatus.Result>(
                      iconSize: 30.0.toHeight(),
                      iconEnabledColor: red,
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text(
                        // Get.find<HomeContentController>().selectedStatusValue ==
                        //         null
                        //     ? ""
                        //     :
                        Get.find<HomeContentController>()
                                    .selectedStatusValue
                                    .orderStatusName ==
                                "all_status"
                            ? getLabel("all_status")
                            :  Pref.getString(Pref.IS_ENGLISH)=="0"?Get.find<HomeContentController>()
                                .selectedStatusValue
                                .orderStatusName:Get.find<HomeContentController>()
                            .selectedStatusValue
                            .orderStatusArabic,
                        // : Get.find<HomeContentController>()
                        //     .selectedStatusValue.orderStatusName,
                        style: textFieldTextStyle(16, black),
                      ),
                      items: Get.find<HomeContentController>()
                          .orderStatusList
                          .map((OrderStatus.Result value) {
                        return new DropdownMenuItem<OrderStatus.Result>(
                          value: value,
                          child: Pref.getString(Pref.IS_ENGLISH)=="0"?Text(
                            // value.orderStatusName,
                            value.orderStatusName,
                            style: TextStyle(color: black),
                          ):Text(
                              value.orderStatusArabic,
                            style: TextStyle(color: black),
                          ),
                        );
                      }).toList(),
                      onChanged: (OrderStatus.Result value) {
                        Get.find<HomeContentController>()
                            .updateStatusDropDown(value);
                        //  setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      color: black,
                    ),
                  )
                ],
              );
      },
    );
  }

  Widget setInputSearch(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: textFieldTextStyle(16, black),
                    keyboardType: TextInputType.multiline,
                    onEditingComplete: () =>
                        Get.find<HomeContentController>().focus.unfocus(),
                    controller:
                        Get.find<HomeContentController>().searchController,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: black),
                        hintText: getLabel("search"),
                        contentPadding: EdgeInsets.only(top: 5,bottom: 5,right: 5)),
                    onFieldSubmitted: (_) =>
                        Get.find<HomeContentController>().focus.unfocus(),
                    onChanged: (text) {
                      if (text.isEmpty) {
                        Get.find<HomeContentController>().searchQuery.value =
                            '0';
                      } else {
                        Get.find<HomeContentController>().searchQuery.value =
                            text;
                      }

                      Get.forceAppUpdate();
                    },
                  ),
                ),
                RaisedButton(
                  color: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    widget.screenlag == 0
                        ? Get.find<HomeContentController>()
                            .searchListByQuery("0")
                        : Get.find<HomeContentController>()
                            .searchDeliveryListByQuery("0");
                    Get.find<HomeContentController>().focus.unfocus();
                  },
                  child: Image.asset(
                    Images.ENTER,
                    height: 20.0,
                    width: 20.0,
                    color: white,
                  ),
                )
                /*Container(
                  child: IconButton(
                    onPressed: () {
                      screenlag == 0
                          ? Get.find<HomeContentController>().searchListByQuery("0")
                          : Get.find<HomeContentController>().searchDeliveryListByQuery("0");
                      Get.find<HomeContentController>().focus.unfocus();
                    },
                    icon: Iconss.Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                )*/
              ],
            ),
          ],
        ));
  }

  Widget setDropDownLastSixMonth(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 0),

      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: DropdownButton<MonthSelction>(
              iconSize: 30.0.toHeight(),
              iconEnabledColor: red,
              underline: SizedBox(),
              isExpanded: true,
              hint: Text(
                Get.find<HomeContentController>().selectedValue == null
                    ? ""
                    : getLabel(
                        '${Get.find<HomeContentController>().selectedValue.value.title}'),
                // : Get.find<HomeContentController>().selectedValue.value.title,
                style: textFieldTextStyle(16, black),
              ),
              items: Get.find<HomeContentController>()
                  .monthSelection
                  .map((MonthSelction value) {
                return new DropdownMenuItem<MonthSelction>(
                  value: value,
                  child: Text(
                    // value.title,
                    getLabel('${value.title}'),
                    style: TextStyle(color: black),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                Get.find<HomeContentController>().selectedValue.value = _;
                Get.find<HomeContentController>().filterMonth.value = _.val;
                widget.screenlag == 0
                    ? Get.find<HomeContentController>().searchListByQuery(
                        "0",
                      )
                    : Get.find<HomeContentController>()
                        .searchDeliveryListByQuery("0");
                Get.find<HomeContentController>().focus.unfocus();
                Get.forceAppUpdate();
              },
            ),
          ),
          divider()
        ],
      ),
    );
  }

  Widget deliveryItem(Delivery.Result deliveryList) {
    // String date = deliveryList.createdDate.day.toString() + "/" + deliveryList.createdDate.month.toString() + "/" + deliveryList.createdDate.year.toString();
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    // String date = orderList.createdDate.day.toString() + "/" + orderList.createdDate.month.toString() + "/" + orderList.createdDate.year.toString();
    String date = dateFormat.format(deliveryList.createdDate);

    return InkWell(
      onTap: () {
        Get.find<HomeContentController>().searchController.clear();
        Get.find<HomeContentController>().searchQuery.value = '0';
        // ignore: unnecessary_statements
        AppConstants.HOME_CLICK == "";
        Get.to(OrderDetails(widget.screenlag, deliveryList.invoiceNo, "home"));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.toWidth()),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    child: Text(
                      deliveryList.invoiceNo,
                      style: textFieldTextStyle(16, black),
                    ),
                  ),
                  SizedBox(
                    width: 8.toWidth(),
                  ),
                  Text(
                    date,
                    style: textFieldTextStyle(16, black),
                  ),
                  SizedBox(
                    width: 8.toWidth(),
                  ),
                  Expanded(
                    child: Text(
                      // ignore: deprecated_member_use
                      deliveryList.orderStatusName.isNull
                          ? "Undefined"
                          : Pref.getString(Pref.IS_ENGLISH) == "0" ?
                      deliveryList.orderStatusName: deliveryList.orderStatusArabic,//deliveryList.orderStatusName,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorConvert(deliveryList.colorCode),
                      ),
                    ),
                  ),
                  /*  screenlag == 1
                      ? Image.asset(
                          Images.IC_MAP_PIN,
                          height: 18.0,
                          width: 18.0,
                        )
                      : Container()*/
                ],
              ),
              Divider(
                thickness: 0.5,
                color: black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customerItem(Result orderList) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    String date = dateFormat.format(orderList.createdDate);
    // String date = orderList.createdDate.day.toString() + "/" + orderList.createdDate.month.toString() + "/" + orderList.createdDate.year.toString();
print("arabic is ${orderList.orderStatusArabic}");
    return InkWell(
      onTap: () {
        Get.find<HomeContentController>().searchController.clear();
        Get.find<HomeContentController>().searchQuery.value = '0';
        AppConstants.HOME_CLICK == "";
        Get.to(OrderDetails(widget.screenlag, orderList.invoiceNo, "Home"));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.toWidth()),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   Container(
                    width: 80,
                    child: Text(
                      orderList.invoiceNo,
                      style: textFieldTextStyle(16, black),
                    ),
                  ),
                  SizedBox(
                    width: 8.toWidth(),
                  ),
                  Text(
                    date,
                    style: textFieldTextStyle(16, black),
                  ),
                  SizedBox(
                    width: 8.toWidth(),
                  ),
                  Expanded(
                    child: Text(Pref.getString(Pref.IS_ENGLISH) == "0" ?
                      orderList.orderStatusName: orderList.orderStatusArabic,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorConvert(orderList.colorCode),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
