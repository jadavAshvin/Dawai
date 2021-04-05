import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Screens/CustomerController/lang_controller.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/BackgroundWidget.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:dawey/Comman/extensions.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  LangController langController = LangController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidget(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.LOGO,
              width: 260.0.toWidth(),
              height: 260.0.toWidth(),
            ),
            SizedBox(
              height: 70.0..toWidth(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: btnUs(context),
                  ),
                  SizedBox(
                    width: 8.0.toWidth(),
                  ),
                  Expanded(
                    child: btnAr(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  btnUs(BuildContext context) {
    return Container(
      width: 160,
      height: 50,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          langController.callLangAPI("en");
        },
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              txtEnglish,
              style: textFieldTextBoldStyle(18.0.toWidth(), white),
            )),
      ),
    );
  }

  btnAr(BuildContext context) {
    return Container(
      width: 160,
      height: 50,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          langController.callLangAPI("ab");
        },
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              txtArabic,
              style: textFieldTextBoldStyle(18.0.toWidth(), white),
            )),
      ),
    );
  }
}
