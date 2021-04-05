import 'package:flutter/material.dart';

Color colorConvert(String color) {
  if(color == null){

    return Colors.black;
  }
  color = color.replaceAll("#", "");
  if (color.length == 6) {
    return Color(int.parse("0xFF" + color));
  } else if (color.length == 8) {
    return Color(int.parse("0x" + color));
  }
}