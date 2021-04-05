import 'package:dawey/Comman/app_constants.dart';
import 'package:dawey/Comman/directional_widget.dart';
import 'package:dawey/Screens/CustomerController/HomeController/home_content_controller.dart';
import 'package:dawey/Utils/colors.dart';
import 'package:dawey/Utils/images.dart';
import 'package:dawey/Utils/strings.dart';
import 'package:dawey/Widget/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawey/Comman/extensions.dart';

// ignore: must_be_immutable
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>  {



  @override
  Widget build(BuildContext context) {
    print("homeeeeeeeeeee");
    return DirectionalWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /*Text(
                getLabel("daywey"),
                style: textFieldTextBoldStyle(35.0.toWidth(), black),
              ),*/
              SizedBox(
                height: 5.0,
              ),
              Image.network(getLabel("tag_line"),),
              SizedBox(
                height: 0.0,
              ),
              Expanded(
                flex: 10,
                child:Image(image: new AssetImage("assets/images/home.gif"))
              )
            ],
          ),
        ),
      ),
    );
  }
}
