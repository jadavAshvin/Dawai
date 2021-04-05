import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:flutter/cupertino.dart';


TextStyle textFieldTextStyle(double fontSize, Color white) {
  return TextStyle(
    fontSize: fontSize,
    color: white,
  );
}

TextStyle textFieldTextBoldStyle(double fontSize, Color white) {
  return TextStyle(
    fontSize: fontSize,
    color: white,
    fontWeight: FontWeight.bold
  );
}
