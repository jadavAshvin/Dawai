import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Models/getProfile.dart';
import 'package:dawey/Screens/Comman/contactUs.dart';
import 'package:dawey/Screens/Comman/dashboard.dart';
import 'package:dawey/Screens/Comman/f&q.dart';
import 'package:dawey/Screens/Comman/home_content.dart';
import 'package:dawey/Screens/Comman/Profile.dart';
import 'package:dawey/Screens/Comman/about.dart';
import 'package:dawey/Screens/Comman/privacyPolicy.dart';
import 'package:dawey/Screens/Comman/select_lang.dart';
import 'package:dawey/Screens/CustomeScreens/myOrder.dart';
import 'package:dawey/Screens/CustomeScreens/splash.dart';
import 'package:dawey/Screens/CustomerController/HomeController/home_content_controller.dart';
import 'package:dawey/Screens/DeliveryBoyScreen/DeliveryBoyProfile.dart';
import 'package:dawey/Screens/DeliveryBoyScreen/myTask.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/mySnackbar.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:dawey/rest/api_services.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class Home extends StatefulWidget {
  final int screenlag;
  Home(this.screenlag);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  PageController pageController;
  int _selectedIndex = 1;
  DateTime backbuttonpressedTime;
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);
    if (backButton) {
      backbuttonpressedTime = currentTime;
      Get.snackbar(getLabel("back_press"), getLabel("double_tap"));
      return false;
    }
    return true;
  }

  GetProfileResponse getProfileResponse = GetProfileResponse();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("scrennn flag is ${widget.screenlag}");
    pageController = PageController(initialPage: 0);
    pageController = PageController(
        initialPage: AppConstants.HOME_CLICK == "1"
            ? 1
            : widget.screenlag == 1
                ? 0
                : 3);

    setState(() {
      widget.screenlag == 1 ? _selectedIndex = 1 : _selectedIndex = 3;
    });
    Get.lazyPut<HomeContentController>(() => HomeContentController(),
        fenix: true);
    Get.find<HomeContentController>().getProfileCall();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: DirectionalWidget(
        child: Scaffold(
          key: _drawerKey,
          body: BackgroundWidget(
            child: Column(
              children: [
                appBar(),
                Expanded(
                  child: Container(
                    child: getPrefValue(Keys.DBOYID) != ""
                        ? PageView(
                            onPageChanged: (index) {
                              setState(() {
                                _selectedIndex = index + 1;
                              });
                              widget.screenlag == 0
                                  ? Get.find<HomeContentController>()
                                      .callOrderListAPI()
                                  : Get.find<HomeContentController>()
                                      .searchDeliveryListByQuery("0");
                            },
                            controller: pageController,
                            children: [
                              HomeContent(),
                              Dashboard(widget.screenlag, "home"),
                            ],
                          )
                        : PageView(
                            onPageChanged: (index) {
                              setState(() {
                                _selectedIndex = index + 1;
                              });
                              widget.screenlag == 0
                                  ? Get.find<HomeContentController>()
                                      .callOrderListAPI()
                                  : Get.find<HomeContentController>()
                                      .searchDeliveryListByQuery("0");
                            },
                            controller: pageController,
                            children: [
                              widget.screenlag == 0
                                  ? MyOrder(widget.screenlag, "dash")
                                  : HomeContent(),
                              /*     getPrefValue(Keys.CUSTOMERID) == ""
                            ? Container()
                            : MyOrder(widget.screenlag, "dash"),*/
                              Dashboard(widget.screenlag, "home"),
                              HomeContent()
                            ],
                          ),
                  ),
                ),
                bottomBar(),
              ],
            ),
          ),
          drawer: appDrawer(),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: false, //getLabel("my_order")
      elevation: 0.0,
      title: Text(
        _selectedIndex == 1
            ? AppConstants.HOME_CLICK == "1"
                ? AppConstants.HOME_CLICK == "1"
                    ? getLabel("pending_task")
                    : getLabel("all_order_status")
                : widget.screenlag == 0
                    ? getLabel("my_order")
                    : getLabel("home")
            : _selectedIndex == 2
                ? getLabel("all_order_status")
                : widget.screenlag == 1
                    ? getLabel("my_order")
                    : getLabel("home"), //panding_task
        style: textFieldTextBoldStyle(25.toWidth(), black),
      ),
      centerTitle: true,
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

  Widget bottomBar() {
    print("page click ${AppConstants.HOME_CLICK}");
    return getPrefValue(Keys.DBOYID) != ""
        ? BottomNavigationBar(
            selectedLabelStyle:
                TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.IC_MENU,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("menu"),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.IC_HOME,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("home"),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.DASHBOARD,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("dashboard"),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              print("click to buttom ${index}");

              print("click to pageController  ${pageController}");

              AppConstants.HOME_CLICK = "";
              setState(() {
                if (index == 0) {
                  //Scaffold.of(context).openDrawer();
                  _drawerKey.currentState.openDrawer();
                } else {
                  _selectedIndex = index;
                  widget.screenlag == 0
                      ? Get.find<HomeContentController>().callOrderListAPI()
                      : Get.find<HomeContentController>()
                          .searchDeliveryListByQuery("0");
                  pageController.animateToPage(index - 1,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceInOut);
                }
              });
            },
          )
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle:
                TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            backgroundColor: Colors.transparent,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.IC_MENU,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("menu"),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.IC_ADD,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("my_order"),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.DASHBOARD,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("status"),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  Images.IC_HOME,
                  height: 24.0,
                  width: 24.0,
                ),
                label: getLabel("home"),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              print("click to buttom ${index}");

              print("click to pageController  ${pageController}");

              AppConstants.HOME_CLICK = "";
              setState(() {
                if (index == 0) {
                  //Scaffold.of(context).openDrawer();
                  _drawerKey.currentState.openDrawer();
                } else {
                  _selectedIndex = index;
                  widget.screenlag == 0
                      ? Get.find<HomeContentController>().callOrderListAPI()
                      : Get.find<HomeContentController>()
                          .searchDeliveryListByQuery("0");
                  pageController.animateToPage(index - 1,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceInOut);
                }
              });
            },
          );
  }

  Drawer appDrawer() {
    return Drawer(
      child: ListView(
        children: [
          drawerHeader(),
          imageWithIcon(getLabel("home"), Images.IC_HOME_SMALL, () {
            Get.offAll(Home(widget.screenlag));

            // setState(() {
            //   _selectedIndex = 1;

            // });
            // Get.back();
          }),
          widget.screenlag == 0
              ? imageWithIcon(getLabel("profile"), Images.MAN, () {
                  Get.to(Profile(widget.screenlag, "home"));
                })
              : imageWithIcon(getLabel("profile"), Images.MAN, () {
                  Get.to(DeliveryBoyProfile());
                }),
          widget.screenlag == 0
              ? imageWithIcon(getLabel("my_order"), Images.ICON_MY_ORDER, () {
                  Get.to(MyOrder(widget.screenlag, "home"));
                })
              : Container(),
          /* : imageWithIcon(txtMedicalCenter, Images.IC_MEDICAL_CENTER, () {
                  Get.to(MedicalCenter(1));
                }),*/
          widget.screenlag == 1
              ? imageWithIcon(getLabel("my_task"), Images.IC_MY_TASK, () {
                  AppConstants.HOME_CLICK = "1";
                  Get.to(MyTask(1));
                })
              : Container(),
          /* imageWithIcon(getLabel("dashboard"), Images.DASHBOARD, () {
            Get.back();
          }),*/
          getPrefValue(Keys.DBOYID) != ""
              ? Container()
              : imageWithIcon(getLabel("status"), Images.DASHBOARD, () {
                  Get.to(Dashboard(widget.screenlag, "dash"));
                  // setState(() {
                  //   _selectedIndex = 2;
                  //   pageController = PageController(initialPage: );
                  // });
                  // Get.back();
                }),
          imageWithIcon(getLabel("about_us"), Images.IC_ABOUT_US, () {
            Get.to(About());
          }),
          imageWithIcon(getLabel("privacy_policy"), Images.IC_PRIVACY_POLICY,
              () {
            Get.to(PrivacyPolicy());
          }),
          imageWithIcon(getLabel("faq"), Images.IC_FAQ, () {
            Get.to(FAQ());
          }),
          imageWithIcon(getLabel("contactus"), Images.IC_CONTACT, () {
            Get.to(ContactUs());
          }),
          imageWithIcon(getLabel("share"), Images.IC_SHARE, () {
          if(GetPlatform.isAndroid){
            share("https://play.google.com/store/apps/details?id=com.dawai.om");
          }else{
            share("https://play.google.com/store/apps/details?id=com.dawai.om");
          }
          }),
          imageWithIcon(getLabel("language"), Images.IC_LABEL, () {
            Get.to(SelectLanguage());
          }),
          imageWithIcon(getLabel("log_out"), Images.IC_LOGOUT, () {
            Get.dialog(
              AlertDialog(
                title: Text(getLabel("are_you_log_out")),
                //content: Text("This should not be closed automatically"),
                actions: <Widget>[
                  FlatButton(
                    child: Text(getLabel("yes")),
                    onPressed: () {
                      Get.back();
                      clearAllData();
                      Get.find<HomeContentController>().orderList.clear();
                      Get.offAll(SplashScreen());
                    },
                  ),
                  FlatButton(
                    child: Text(getLabel("no")),
                    onPressed: () {
                      Get.back();
                    },
                  )
                ],
              ),
              barrierDismissible: false,
            );
          }),
        ],
      ),
    );
  }

  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Share via',
        linkUrl: url,
        chooserTitle: 'Chooser Title');
  }
  Widget drawerHeader() {
    return DrawerHeader(
      child: Column(
        children: [
          CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(55.0)),
              child: getPrefValue(Keys.IMG_URL).isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: Images.MAN,
                      image: getPrefValue(Keys.IMG_URL),
                      // .replaceAll('\\', '//'),
                      fit: BoxFit.cover,
                      width: 110.0,
                      height: 110.0,
                    )
                  : Image.asset(
                      Images.MAN,
                      fit: BoxFit.cover,
                      width: 32.0,
                      height: 32.0,
                    ),
            ),
            radius: 40,
          ),
          SizedBox(
            height: 5.0.toWidth(),
          ),
          Text(
          utf8.decode(getPrefValue(Keys.NAME).codeUnits) ,
            style: textFieldTextBoldStyle(16.0.toWidth(), black),
          ),
          SizedBox(
            height: 3.0.toWidth(),
          ),
          Text(
            getPrefValue(Keys.MOBILE),
            style: textFieldTextStyle(12.0.toWidth(), black),
          ),
        ],
      ),
    );
  }

  imageWithIcon(String title, String img, Null Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 12.0.toWidth(), horizontal: 16.0.toWidth()),
        child: Row(
          children: [
            Image.asset(
              img,
              height: 23.0.toWidth(),
              width: 23.0.toWidth(),
            ),
            SizedBox(
              width: 12.0.toWidth(),
            ),
            Text(
              title,
              style: textFieldTextBoldStyle(16.0.toWidth(), black),
            ),
          ],
        ),
      ),
    );
  }
}
