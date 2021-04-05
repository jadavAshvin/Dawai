import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Comman/keys.dart';
import 'package:dawey/Screens/CustomerController/AboutUs/aboutUsController.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/backIcon.dart';
import 'package:dawey/Widget/button.dart';
import 'package:dawey/Widget/progressBar.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

class ContactUs extends StatelessWidget {
  AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    aboutUsController.contactUsAPI();

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
                            /*  Text(
                        aboutUsController.aboutUsList[0].cmsName + ":",
                        style: textFieldTextBoldStyle(18, black),
                      ),*/
                            SizedBox(
                              height: 20,
                            ),
                            Html(
                              shrinkWrap: true,
                              data: aboutUsController.aboutUsList[0].cmsContent,
                              onLinkTap: (url) {
                                print("Opening $url");
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                           getPrefValue(Keys.CUSTOMERID)==""?Container():  Column(children: [
                              setFeedbackView(context),
                              SizedBox(
                                height: 10,
                              ),

                              Center(
                                child: Obx(() {
                                  return aboutUsController.isLoading.value
                                      ? CupertinoActivityIndicator(
                                    radius: 18,
                                  )
                                      :  Center(
                                    child: CustomButton(getLabel("send"), () {
                                      aboutUsController.callSendFeedbackAPI();
                                    }),
                                  );
                                }),
                              ),

                            ],)

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

  Widget setFeedbackView(BuildContext context) {
    return Container(
        height: 100.0,
        child: TextFormField(
          maxLines: 3,
          style: textFieldTextStyle(16, black),
          keyboardType: TextInputType.multiline,
          controller: aboutUsController.feedBackController,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: black),
             // labelText: getLabel("your_feedback"),
              hintText: getLabel("your_feedback"),
              contentPadding: EdgeInsets.all(5)),
          onFieldSubmitted: (_) => aboutUsController.focus.nextFocus(),
          onChanged: (text) {},
        ));
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: iconsBotton(),
      elevation: 0.0,
      title: Text(
        getLabel("contactus"),
        style: textFieldTextBoldStyle(25, black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}
