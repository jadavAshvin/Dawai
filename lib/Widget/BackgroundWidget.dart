import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Comman/extensions.dart';
import 'package:dawey/Utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return DirectionalWidget(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: -30.0.toWidth(),
              top: -30.0.toWidth(),
              child: Image.asset(
                Images.IC_UPPOR,
                width: 150.0.toWidth(),
                height: 150.0.toWidth(),
              ),
            ),
            Positioned(
              right: -25.0.toWidth(),
              bottom: -25.0.toWidth(),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  Images.IC_LOWER,
                  width: 150.0.toWidth(),
                  height: 150.0.toWidth(),
                ),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
