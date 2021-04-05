import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageView extends StatelessWidget {
  String image;
  double sizeHeight;
  double sizeWidth;
  ImageView(this.image,this.sizeHeight,this.sizeWidth);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,fit: BoxFit.cover,height:sizeHeight ,width: sizeWidth,);
  }
}
