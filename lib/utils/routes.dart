import 'package:bmi_calc/screens/home_screen/page/bmi_calc.dart';
import 'package:bmi_calc/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'appRoutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => BmiCalc(),
  AppRoutes().splashScreen: (context) => SplashScreen(),
};
