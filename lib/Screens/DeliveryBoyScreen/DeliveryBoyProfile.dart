import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Screens/CustomeScreens/otpView.dart';
import 'package:dawey/Screens/CustomeScreens/register.dart';
import 'package:dawey/Screens/DeliveryBoyController/deliveryBoyProfileController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeliveryBoyProfile extends StatefulWidget {
  @override
  _DeliveryBoyProfileState createState() => _DeliveryBoyProfileState();
}

class _DeliveryBoyProfileState extends State<DeliveryBoyProfile> {
  DelvieryBoyProfileController profileController =
      DelvieryBoyProfileController();

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Scaffold(
        backgroundColor: white,
        body: BackgroundWidget(
          child: ListView(
            children: [
              Column(
                children: [
                  appBar(),
                  topImage(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                    child: Column(
                      children: [
                        /*    Row(
                          children: [
                            Expanded(
                              child: setInputNationalId(context),
                            ),
                            SizedBox(width: 5,),
                            btnUpload(context),
                          ],
                        ),
*/
                        setNameView(context),
                        inputSpaceHeight(),
                        Row(
                          children: [
                            Expanded(
                              child: setMobileView(context),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                           // btnVerified(context)
                          ],
                        ),
                        inputSpaceHeight(),
                       // setGovernorateView(context),
                        /* inputSpaceHeight(),
                        Row(
                          children: [
                            Expanded(
                              child: setDeliveryAddressView(context),
                            ),
                            InkWell(
                              onTap: (){Get.to(MapScreen());},
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ImageView(Images.IC_PIN, 25, 25
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        inputSpaceHeight(),
                        Row(
                          children: [
                            Expanded(
                              child: setWayNoView(context),
                            ),
                            Expanded(
                              child: setStreetNameView(context),
                            ),
                          ],
                        ),
                        inputSpaceHeight(),
                        Row(
                          children: [
                            Expanded(
                              child: setBuildingVillaView(context),
                            ),
                            Expanded(
                              child: setPlotNoView(context),
                            ),
                          ],
                        ),
                        inputSpaceHeight(),
                        setGovernorateView(context),
                        inputSpaceHeight(),
                        setDropDownWilayat(context),
                        inputSpaceHeight(),
                        setNearestView(context),
                        inputSpaceHeight(),
                        SizedBox(height: 20,),
                        //CustomButton(txtSave, (){   }),
*/
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setInputNationalId(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(18, black),
          keyboardType: TextInputType.text,
          controller: profileController.nationalIdController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: black),
              hintText: getLabel("national_id"),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setInputMRNO(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.mrnNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("mrn_no"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setNameView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.nameController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("mobile"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setMobileView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.number,
          controller: profileController.mobileNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("mobile_no"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setDeliveryAddressView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.deliveryAddressController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("del_add"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setWayNoView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.wayNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("way_no"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setStreetNameView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.number,
          controller: profileController.streetNameController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("street_name"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setBuildingVillaView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.buildingController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("building_villa"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setPlotNoView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.plotNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("plot_no"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setGovernorateView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.governorateController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: "Address",
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setDropDownWilayat(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: DropdownButton<String>(
              iconSize: 30.0.toHeight(),
              iconEnabledColor: red,
              underline: SizedBox(),
              isExpanded: true,
              hint: Text(
                getLabel("wilayat"),
                style: textFieldTextStyle(16, black),
              ),
              items: <String>['item1', 'item2', 'item3'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: black),
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -5.0, 0.0),
            child: Divider(
              thickness: 0.5,
              color: black,
            ),
          )
        ],
      ),
    );
  }

  Widget setNearestView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.nearestLandmarkController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: getLabel("nearest_landmark"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  btnUpload(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Get.to(Register(1));
        },
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              getLabel("upload"),
              style: textFieldTextBoldStyle(15, white),
            )),
      ),
    );
  }

  btnVerified(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Get.to(OtpView(0, ""));
        },
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              getLabel("verified"),
              style: textFieldTextBoldStyle(15, white),
            )),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("profile"),
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

  Widget topImage() {
    return Padding(
      padding: EdgeInsets.all(14.0.toWidth()),
      child: Image.asset(
        Images.ICONPROILE,
        height: 120.0.toWidth(),
        width: 200.0.toWidth(),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget inputSpaceHeight() {
    return SizedBox(
      height: 4.0.toWidth(),
    );
  }
}
