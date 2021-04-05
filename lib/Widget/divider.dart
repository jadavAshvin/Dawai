import 'package:dawey/Utils/colors.dart';
import 'package:flutter/material.dart';

divider(){
  return   Container(
    transform: Matrix4.translationValues(0.0, -10.0, 0.0),
    child: Divider(
      thickness: 0.5,
      color: black,
    ),
  );
}
