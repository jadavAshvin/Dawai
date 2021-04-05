import 'package:flutter/material.dart';

class ProgressCircule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 40,
            width: 40,
            child: CircularProgressIndicator()));
  }
}
