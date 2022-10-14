import 'package:bmi_calc/utils/appRoutes.dart';
import 'package:bmi_calc/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator animation",
      //home: HomePage(),
      initialRoute: AppRoutes().splashScreen,
      routes: routes,
    );
  }
}
