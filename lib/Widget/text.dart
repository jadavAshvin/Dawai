import 'package:dawey/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


title_text({double fontSize, String title,BuildContext context}) {
  return Text(title,
      style: Theme.of(context)
          .textTheme
          .button
          .copyWith(
        color: white,
      ).copyWith(color: Colors.white, fontSize: fontSize));
}
bigTitle_text({double fontSize, String title,BuildContext context}) {
  return Text(title,
      style: Theme.of(context)
          .textTheme
          .button
          .copyWith(
        color: white,
      ).copyWith(color:primaryColor, fontSize: fontSize,fontWeight: FontWeight.bold));
}
title_text_grey({double fontSize, String title,BuildContext context}) {
  return Text(title,
      style: Theme.of(context)
      .textTheme
      .button
      .copyWith(
    color: white,
  ).copyWith(color: grey, fontSize: fontSize));
}



/*
Widget profileHeadingText({String title, double fontSize}) {
  return Text(
    title,
    style: TextStyle(
        fontSize: fontSize,
        color: profileFontColor,
        fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
  );
}

Widget profileSubtitleText({String title, double fontSize,TextAlign txtAlign}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize,
      color: const Color(0xff7787a3),
    ),
    textAlign:txtAlign==null? TextAlign.center:txtAlign,
  );
}

Widget subTitleText({double fontSize, String title}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize,
      color: subTitleColor,
    ),
    textAlign: TextAlign.center,
  );
}

Widget subTitleTextLeft({double fontSize, String title}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize,
      color: subTitleColor,
    ),
    textAlign: TextAlign.left,
  );
}

Widget textHeading({String title}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: SizeConfig.size24,
      color: const Color(0xff7a8aa5),
      fontWeight: FontWeight.bold,
      letterSpacing: -0.6000000000000001,
    ),
    textAlign: TextAlign.left,
  );
}

Widget textFieldTitle({double fontSize, String title}) {
  return Text(
    title,
    style: TextStyle(
        fontSize: fontSize, color: subTitleColor, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

*/

