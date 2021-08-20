import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:owl_reminder/style.dart';
import 'package:owl_reminder/view/calender_remind.dart';
import 'package:owl_reminder/view/homepage.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: lightTheme,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
