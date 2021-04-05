import 'package:dawey/Comman/pref.dart';
import 'package:flutter/material.dart';

class DirectionalWidget extends StatelessWidget {
  final Widget child;

  DirectionalWidget({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Pref.getString(Pref.IS_ENGLISH).isEmpty ||
              Pref.getString(Pref.IS_ENGLISH) == "0"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: child,
    );
  }
}
