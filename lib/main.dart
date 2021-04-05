import 'package:dawey/Comman/ui_config.dart';
import 'package:dawey/Screens/CustomeScreens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  {
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  //SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'DAWAI',
        theme: ThemeData(
          primaryColor: Colors.black,
          // primarySwatch: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                UIConfig().init(constraints, orientation);
                return SplashScreen();
              },
            );
          },
        ),
      ),
    );
  }
}
