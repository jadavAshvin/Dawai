import 'package:flutter/material.dart';


class NoItemFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(20.0),
      child: Center(
        child:  Text(
          "No data found",
          style: Theme.of(context).textTheme.headline1.copyWith(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
