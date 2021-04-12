import 'dart:io';

import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Models/cityName.dart';
import 'package:dawey/Screens/Comman/privacyPolicy.dart';
import 'package:dawey/Screens/CustomerController/ProfileController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/imageView.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  final int screenlag;
  final String screenName;

  Profile(this.screenlag, this.screenName);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController = Get.put(ProfileController());
  File _image;
  int isSame;
  @override
  void initState() {
    super.initState();
    print('Profile Screen Name: ' + widget.screenName);
    profileController.callCityNameAPI();
    if (widget.screenName == 'home') {
      print('home');
      profileController.setValuesToFields();
    /*  getPrefValue(Keys.NATIONALI_FILE) == ""
          ? profileController.natimageUploaded(false)
          : profileController.natimageUploaded(true);*/
    }
  }

  imageShowDialog() {
    return Get.defaultDialog(
      title: getLabel("upload_national_id"),
      cancel: FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Back')),
      content: Container(
        child: profileController.image == null
            ? FadeInImage.assetNetwork(
                placeholder: Images.MAN,
                image: getPrefValue(Keys.NATIONALI_FILE),
                // .replaceAll('\\', '//'),
                fit: BoxFit.contain,
                width: 500.0,
                height: 500.0,
              )
            : Image.file(
                profileController.image,
                fit: BoxFit.contain,
                width: 500.0,
                height: 500.0,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        widget.screenName == "home" ? Get.back() : SystemNavigator.pop();
      },
      child: DirectionalWidget(
        child: Scaffold(
          backgroundColor: white,
          body: BackgroundWidget(
            child: SafeArea(
              child: ListView(
                children: [
                  Column(
                    children: [
                      appBar(),
                      setProfileView(context),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 30, right: 30, bottom: 80),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*  Row(
                              children: [
                                Expanded(
                                  child: setInputNationalId(context),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                btnUpload(context),
                              ],
                            ),*/
                            SizedBox(
                              height: 10,
                            ),
                            setInputNationalId(context),

                       /*
                        inputSpaceHeight(),
                        inputSpaceHeight(),
                       InkWell(
                              onTap: () {
                                profileController.cameraBottomSheet(
                                  context,
                                );
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          imageShowDialog();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  style: BorderStyle.none,
                                                  width: 1,
                                                  color: black),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: profileController.image == null
                                              ? FadeInImage.assetNetwork(
                                                  placeholder: Images.MAN,
                                                  image: getPrefValue(
                                                      Keys.NATIONALI_FILE),
                                                  // .replaceAll('\\', '//'),
                                                  fit: BoxFit.contain,
                                                  width: 50.0,
                                                  height: 32.0,
                                                )
                                              : Image.file(
                                                  profileController.image,
                                                  fit: BoxFit.contain,
                                                  width: 32.0,
                                                  height: 32.0,
                                                ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  style: BorderStyle.none,
                                                  width: 1,
                                                  color: black),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Obx(() => Flexible(
                                                      child: Text(
                                                        profileController
                                                                .natimageUploaded
                                                                .value
                                                            ? Pref.getString(Pref
                                                                        .IS_ENGLISH) ==
                                                                    "0"
                                                                ? getLabel(
                                                                    "upload_national_id")
                                                                : getLabel(
                                                                    "uploaded_national_id")
                                                            : getLabel(
                                                                "upload_your_national_id"),
                                                        style:
                                                            textFieldTextBoldStyle(
                                                                18, black),
                                                      ),
                                                    )),
                                                Obx(
                                                  () => profileController
                                                          .natimageUploaded
                                                          .value
                                                      ? Icon(
                                                          Icons
                                                              .done_outline_rounded,
                                                          color: Colors.red,
                                                        )
                                                      : Icon(Icons.cancel),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: black,
                                  ),
                                ],
                              ),
                            ),*/
                            inputSpaceHeight(),
                            inputSpaceHeight(),
                            setInputMRNO(context),
                            inputSpaceHeight(),
                            setNameView(context),
                            setLastView(context),
                            inputSpaceHeight(),
                            Row(
                              children: [
                                Expanded(
                                  child: setMobileView(context),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                btnVerified(context)
                              ],
                            ),
                            inputSpaceHeight(),
                            setEmailView(context),
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
                            setDeliveryAddressView(context),
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
                            inputSpaceHeight(),
                            setNearestView(context),
                            inputSpaceHeight(),
                            setGovernorateView(context),
                            inputSpaceHeight(),
                            setDropDownWilayat(context),
                            // inputSpaceHeight(),
                            setCheckBoxView(),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() {
                              return profileController.isLoading.value
                                  ? CupertinoActivityIndicator(
                                      radius: 18,
                                    )
                                  : CustomButton(
                                      widget.screenName == 'home'
                                          ? getLabel("updates")
                                          : Pref.getString(Pref.IS_ENGLISH) ==
                                                  "0"
                                              ? getLabel("saves")
                                              : "حفظ", () {
                                      profileController.smbSave(
                                          widget.screenlag, widget.screenName);
                                    });
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget setProfileView(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 110.0,
        height: 110.0,
        child: Stack(
          children: [
            CircleAvatar(
              maxRadius: 55.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(55.0)),
                child: _image == null
                    ? FadeInImage.assetNetwork(
                        placeholder: Images.MAN,
                        image: getPrefValue(Keys.IMG_URL),
                        // .replaceAll('\\', '//'),
                        fit: BoxFit.cover,
                        width: 110.0,
                        height: 110.0,
                      )
                    : Image.file(
                        _image,
                        fit: BoxFit.cover,
                        width: 110.0,
                        height: 110.0,
                      ),
              ),
            ),
            InkWell(
              onTap: () {
                _cameraBottomSheet(context);
              },
              child: Container(
                margin: EdgeInsets.all(3.0),
                alignment: Alignment.bottomRight,
                child: ImageView(Images.IC_IMAGE_CAMERA, 25, 25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setCheckBoxView() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // TenSizeBoxWidth(),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: (profileController.isChecked.value)
                        ? Colors.black
                        : Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
              width: 20,
              height: 20,
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.transparent,
                ),
                child: Obx(() => Checkbox(
                      activeColor: Colors.white,
                      checkColor: red,
                      value: profileController.isChecked.value,
                      tristate: false,
                      onChanged: (bool isChecked) {
                        profileController.updateCheckBox(isChecked);
                      },
                    )),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Get.to(PrivacyPolicy());
              profileController.privacyColor(true);
              profileController.update();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 2.0),
              child: Obx(
                () => Text(
                  getLabel("privacy_policy_content"),
                  style: textFieldTextStyle(
                    16,
                    profileController.privacyColor.value ? red : Colors.blue,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget setInputNationalId(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          //  readOnly: widget.screenName == "home" ? true : false,
          style: textFieldTextStyle(18, black),
          keyboardType: TextInputType.number,
          enabled: true,
          controller: profileController.nationalIdController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: black),
              labelText: getLabel("national_id"),
              //   hintText: getLabel("national_id"),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {
            print(profileController.nationalIdController.text);
          },
        ));
  }

  Widget setInputMRNO(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          // readOnly:  profileController.mrnNoController.text.isEmpty ? true : false,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.number,
          enabled: true,
          // profileController.mrnNoController.text.isEmpty ? true : false,
          controller: profileController.mrnNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("mrn_no"),
              // hintText: getLabel("mrn_no"),
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
              labelText: getLabel("mobile"),
              //  hintText: getLabel("mobile"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget setLastView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.text,
          controller: profileController.lastNameController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("lastname"),
              //  hintText: getLabel("lastname"),
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
              labelText: getLabel("mobile_no"),
              //  hintText: getLabel("mobile_no"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {
            if (getPrefValue(Keys.MOBILE) == text) {
              print("sameee");
              isSame = 1;
            } else {
              isSame = 0;
              print("diffrent");
              btnVerified(context);
            }
            setState(() {});
          },
        ));
  }

  Widget setEmailView(BuildContext context) {
    return Container(
        height: 50.0,
        child: TextFormField(
          maxLines: 1,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.emailAddress,
          controller: profileController.emailController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("email_id"),
              //  hintText: getLabel("email_id"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  btnVerified(BuildContext context) {
    return Container(
      width: isSame == 0 ? 100 : 50,
      height: isSame == 0 ? 40 : 35,
      child: RaisedButton(
          color: buttonColor,
          disabledColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            //1254698736
            // if (getPrefValue(Keys.NUMBER_VERIFY_FLAG) == "0") {
            if (isSame == 0) {
              AppConstants.NATIONALID =
                  profileController.nationalIdController.text;
              AppConstants.NAME = profileController.nameController.text;
              AppConstants.LASTNAME = profileController.lastNameController.text;
              AppConstants.MRNNO = profileController.mrnNoController.text;
              AppConstants.DELIVERYADDRESS =
                  profileController.deliveryAddressController.text;
              AppConstants.BUILDING = profileController.buildingController.text;
              AppConstants.PLOTNO = profileController.plotNoController.text;
              AppConstants.STREETNAME =
                  profileController.streetNameController.text;
              AppConstants.WAYNO = profileController.wayNoController.text;
              AppConstants.NEARESTLANDMARK =
                  profileController.nearestLandmarkController.text;

              profileController.smbVerifyCLick(0);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: isSame == 0
                ? Text(
                    getLabel("verify"),
                    style: textFieldTextBoldStyle(15, white),
                  )
                : Row(
                    children: <Widget>[
                      //      Text(
                      //  getLabel("verified"),
                      // style: textFieldTextBoldStyle(15, white),
                      //  ),
                      Expanded(
                          child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ))
                    ],
                  ),
            // getLabel("verified"),
          )),
    );

    /* return Obx(() {
      print("emtyy  ...${ getPrefValue(Keys.MOBILE)!=""}");
      return  getPrefValue(Keys.MOBILE)==""?Container(): ;
    });*/
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
              labelText: getLabel("del_add"),
              // hintText: getLabel("del_add"),
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
          keyboardType: TextInputType.number,
          controller: profileController.wayNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("way_no"),
              // hintText: getLabel("way_no"),
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
          keyboardType: TextInputType.text,
          controller: profileController.streetNameController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("street_name"),
              //hintText: getLabel("street_name"),
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
          keyboardType: TextInputType.number,
          controller: profileController.buildingController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("building_villa"),
              //  hintText: getLabel("building_villa"),
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
          keyboardType: TextInputType.number,
          controller: profileController.plotNoController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("plot_no"),
              // hintText: getLabel("plot_no"),
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
          enabled: false,
          controller: profileController.governorateController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: getLabel("governorate"),
              //  hintText: getLabel("governorate"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  void _cameraBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.camera),
                    title: Text(getLabel("camera"),
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.normal,
                            color: black,
                            fontSize: 18.0)),
                    onTap: () {
                      getImageFromCamera();
                    }),
                Center(
                  child: ListTile(
                    leading: Icon(Icons.image),
                    title: Text(getLabel("gallery"),
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.normal,
                            color: black,
                            fontSize: 18.0)),
                    onTap: () => getImageFromGallery(),
                  ),
                ),
                ListTile(
                  title: Center(
                      child: Text(getLabel("cancel"),
                          style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.normal,
                              color: black,
                              fontSize: 18.0))),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          );
        });
  }

  Future getImageFromCamera() async {
    print("Camera");
    final picker = ImagePicker();
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    _image = file;
    profileController.profileImage = file;
    profileController.callOnlyProfileImageApi(file);
    setState(() {});
    print(file.path);
    Get.back();
    //showCropView(image);
  }

  Future getImageFromGallery() async {
    print("Gallery");
    final picker = ImagePicker();
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = file;
    profileController.profileImage = file;
    profileController.callOnlyProfileImageApi(file);
    setState(() {});
    Get.back();
    //showCropView(image);
  }

  Widget setDropDownWilayat(BuildContext context) {
    return Obx(() {
      return Container(
        transform: Matrix4.translationValues(00, -5, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              transform: Matrix4.translationValues(00, 10, 0),
              child: Text(
                getLabel("wilayat"),
                style: TextStyle(color: grey),
              ),
            ),
            Container(
              width: double.infinity,
              child: DropdownButton<Result>(
                iconSize: 30.0.toHeight(),
                iconEnabledColor: red,
                underline: SizedBox(),
                isExpanded: true,
                hint: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    profileController.selectedValue == null
                        ? ""
                        : Pref.getString(Pref.IS_ENGLISH) == "0"
                            ? profileController.selectedValue.name
                            : profileController.selectedValue.abName,
                    style: textFieldTextStyle(16, black),
                  ),
                ),
                items: profileController.cityList.map((Result value) {
                  return new DropdownMenuItem<Result>(
                    value: value,
                    child: Text(
                      Pref.getString(Pref.IS_ENGLISH) == "0"
                          ? value.name
                          : value.abName,
                      style: TextStyle(color: black),
                    ),
                  );
                }).toList(),
                onChanged: (Result value) {
                  AppConstants.City_Name = value.name;
                  profileController.updateDropDown(value);
                  setState(() {});
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              child: Divider(
                thickness: 0.5,
                color: black,
              ),
            )
          ],
        ),
      );
    });
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
              labelText: getLabel("nearest_landmark"),
              //hintText: getLabel("nearest_landmark"),
              hintStyle: TextStyle(color: black),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => profileController.focus.unfocus(),
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
          profileController.cameraBottomSheet(
            context,
          );
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

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        getLabel("profile"),
        style: textFieldTextBoldStyle(25, black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
            color: Pref.getString(Pref.IS_ENGLISH) == "0"
                ? Colors.white
                : Colors.red),
        onPressed: () =>
            widget.screenName == "home" ? Get.back() : SystemNavigator.pop(),
      ),
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
