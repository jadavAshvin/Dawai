import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Screens/CustomerController/AboutUs/aboutUsController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/progressBar.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicy extends StatelessWidget {
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    aboutUsController.privacyPolicyAPI();
    return DirectionalWidget(
      child: Scaffold(
        body: BackgroundWidget(
          child: ListView(
            children: [
              appBar(),
              SizedBox(
                height: 10.0.toHeight(),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Obx(() {
                  return aboutUsController.aboutUsList.isEmpty
                      ? ProgressCircule()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* Text(
                              aboutUsController.aboutUsList[0].cmsName + ":",
                              style: textFieldTextBoldStyle(18, black),
                            ),*/
                            SizedBox(
                              height: 20,
                            ),
                            /* HtmlView(
                              data: aboutUsController.aboutUsList[0].cmsContent,
                              stylingOptions: null,
                            )*/
                            Html(
                              shrinkWrap: true,
                              data: aboutUsController.aboutUsList[0].cmsContent,
                              onLinkTap: (url) {
                                print("Opening $url");
                              },
                            ),
                          ],
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: iconsBotton(),
      elevation: 0.0,
      title: Text(
        getLabel("privacy_policy"),
        style: textFieldTextBoldStyle(25, black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}
