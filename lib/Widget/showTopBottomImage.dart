import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Utils/images.dart';
import 'package:flutter/material.dart';


class TopBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Stack(children: [
        Container(
            transform: Matrix4.translationValues(-62.0, -37.0, 0.0),
            child: Image.asset(Images.IC_UPPOR,fit: BoxFit.fitWidth,width: 200,height: 200,)),

        Container(
            alignment: Alignment.bottomRight,
            transform: Matrix4.translationValues(40.0, 40.0, 00.0),
            child: Image.asset(Images.IC_LOWER,fit: BoxFit.fitWidth,width: 200,height: 200,)),
      ],),
    );
  }
}
