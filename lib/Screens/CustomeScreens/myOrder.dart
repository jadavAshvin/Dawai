import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/Comman/Profile.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/progressBar.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:get/get.dart';
import 'package:dawey/Screens/CustomerController/MyOrder/myOrderController.dart';
import 'package:dawey/Models/pharmacyResponse.dart' as Pharmacy;

class MyOrder extends StatefulWidget {
  final int screenlag;
  final String screenName;
  MyOrder(this.screenlag, this.screenName);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final MyOrderController myOrderController = Get.put(MyOrderController());
  var building, plot, delivery, way, street, nearest;

  @override
  void initState() {
    super.initState();

    print("screeee name is ${widget.screenName}");
    if (widget.screenName == 'home') {
      myOrderController.getProfilDetailseAPI();
    } else if (widget.screenName == 'dash') {
      myOrderController.getProfilDetailseAPI();
    }

    myOrderController.isLoading(false);
  }

  @override
  Widget build(BuildContext context) {

    return widget.screenName == "dash"
        ? Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                topImage(),
                Container(
                  transform: Matrix4.translationValues(0.0, -150.0, 0.0),
                  child: Obx(() => myOrderController.isLoading.value
                      ? ProgressCircule()
                      : checkFromScreen(widget.screenName)),
                ),
              ],
            ),
          ),
        )
        : DirectionalWidget(
          child: Scaffold(
     // backgroundColor: Colors.transparent,
              body: BackgroundWidget(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      appBar(),
                      topImage(),
                      Container(
                        transform: Matrix4.translationValues(0.0, -150.0, 0.0),
                        child: Obx(() => myOrderController.isLoading.value
                            ? ProgressCircule()
                            : checkFromScreen(widget.screenName)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        );
  }

  Widget checkFromScreen(screen) {
    return screen == "home"
        ? Obx(() => myOrderController.profileDetails.isEmpty
            ? ProgressCircule()
            : columWidget(screen))
        : columWidget(screen);
  }

  Widget columWidget(screen) {
    return Column(
      children: [
        setInputNationalId(context),
        SizedBox(
          height: 5,
        ),
        setInputMRNO(context),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child:  setAddressView(context),
        ),
        SizedBox(
          height: 10,
        ),
        setNearMedicalView(context),
        SizedBox(
          height: 5,
        ),
        setInputAnyComment(context),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: setTheServiceView(context),
        ),
        SizedBox(
          height: 30,
        ),
        CustomButton(getLabel("place_order"), () {
          myOrderController.smbPlaceOrder(widget.screenlag);
          // Get.to(ThankYou(screenlag));
        }),
      ],
    );
  }

  Widget topImage() {
    return Container(
      transform: Matrix4.translationValues(-20.0, -80.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Image.asset(
          Images.IC_MY_ORDER,
          height: 210.0.toHeight(),
          width: 210.0.toWidth(),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("my_order"),
        style: textFieldTextBoldStyle(25, black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: iconsBotton(),
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

  Widget setInputNationalId(BuildContext context) {
    if (AppConstants.NATIONALID == "") {
    } else {}
    return Container(
        padding: EdgeInsets.only(left: 32, right: 32),
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: myOrderController.nationalIdController,
          textInputAction: TextInputAction.next,
          enabled: false,
          decoration: InputDecoration(
              labelText: getLabel("national_id"),
              hintStyle: TextStyle(color: black),
              hintText: getLabel("national_id"),
              contentPadding: EdgeInsets.only(right: 5,top: 5,bottom: 5,)),
          onFieldSubmitted: (_) => myOrderController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setInputMRNO(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: myOrderController.mrnNoController,
          enabled: false,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("mrn_no"),
              hintText: getLabel("mrn_no"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.only(right: 5,top: 5,bottom: 5)),
          onFieldSubmitted: (_) => myOrderController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setInputAnyComment(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        height: 100.0,
        child: TextFormField(
          maxLines: 3,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.multiline,
          controller: myOrderController.addCommentController,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            alignLabelWithHint: true,
              labelStyle: TextStyle(color: black),
          //    labelText: getLabel("any_comments"),
              labelText: getLabel("any_comments"),
              contentPadding: EdgeInsets.only(right: 5,top: 5,bottom: 5)),
          onFieldSubmitted: (_) => myOrderController.focus.unfocus(),
          onChanged: (text) {},
        ));
  }

  Widget setAddressView(BuildContext context) {
    return Obx(() {
      building = AppConstants.BUILDING.trim().isEmpty
          ? ""
          : "${AppConstants.BUILDING},";
      plot =
          AppConstants.PLOTNO.trim().isEmpty ? "" : "${AppConstants.PLOTNO},";
      delivery = AppConstants.DELIVERYADDRESS.trim().isEmpty
          ? ""
          : "${AppConstants.DELIVERYADDRESS},";
      way = AppConstants.WAYNO.trim().isEmpty ? "" : "${AppConstants.WAYNO},";
      street = AppConstants.STREETNAME.trim().isEmpty
          ? ""
          : AppConstants.NEARESTLANDMARK.trim().isEmpty
              ? "${AppConstants.STREETNAME}"
              : "${AppConstants.STREETNAME},";
      nearest = AppConstants.NEARESTLANDMARK.trim().isEmpty
          ? ""
          : "${AppConstants.NEARESTLANDMARK}";
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (myOrderController.deliveryIsChecked.value)
                          ? Colors.black
                          : Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    )),
                width: 17.0.toWidth(),
                height: 16.0.toHeight(),
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.transparent,
                  ),
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.red,
                    value: myOrderController.deliveryIsChecked.value,
                    tristate: false,
                    onChanged: (bool isChecked) {
                      myOrderController.deliveryIsChecked.value = isChecked;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                getLabel("select_del_add") +
                    "\n" +
                    delivery +
                    way +
                    plot +
                    building +
                    street +
                    nearest,
                style: textFieldTextStyle(16, black),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget setNearMedicalView(BuildContext context) {
    return Obx(
      () {
        return myOrderController.selectedValue == null
            ? ProgressCircule()
            : Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: DropdownButton<Pharmacy.Result>(
                        iconSize: 30.0.toHeight(),
                        iconEnabledColor: red,
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text(
                          myOrderController.selectedValue == null
                              ? ""
                         : Pref.getString(Pref.IS_ENGLISH) == "0"
                              ? myOrderController.selectedValue.pharmacyname
                              : myOrderController.selectedValue.pharmacynameAb,
                          style: textFieldTextStyle(16, black),
                        ),
                        items: myOrderController.phararmacyList
                            .map((Pharmacy.Result value) {
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
                          myOrderController.updateDropDown(value);
                          setState(() {});
                        },
                      ),
                    ),
                    /* Container(
                width: double.infinity,
                child: DropdownButton<PharmacyResult>(
                  iconSize: 30.0.toHeight(),
                  iconEnabledColor: red,
                  underline: SizedBox(),
                  isExpanded: true,
                  hint: Text(
                    myOrderController.selectedValue.value.pharmacyname == null
                        ? txtNearestMedical
                        : myOrderController.selectedValue.value.pharmacyname,

                    style: textFieldTextStyle(16, black),
                  ),
                  items: myOrderController.pharmacy.map((PharmacyResult value) {
                    return new DropdownMenuItem<PharmacyResult>(
                      value: value,
                      child: Text(
                        value.pharmacyname,
                        style: TextStyle(color: black),
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {
                    myOrderController.selectedValue.value = _;
                    Get.forceAppUpdate();
                  },
                ),
              ),*/
                    Divider(
                      thickness: 0.5,
                      color: black,
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget setTheServiceView(BuildContext context) {
    return Obx(
      () => Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (myOrderController.serviceISChecked.value)
                          ? Colors.black
                          : Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    )),
                width: 17.0.toWidth(),
                height: 16.0.toHeight(),
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.transparent,
                  ),
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.red,
                    value: myOrderController.serviceISChecked.value,
                    tristate: false,
                    onChanged: (bool isChecked) {
                      myOrderController.serviceISChecked.value = isChecked;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                getLabel("service_charge"),
                style: textFieldTextStyle(16, black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
