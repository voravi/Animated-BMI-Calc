import 'package:bmi_calc/screens/home_screen/page/bmi_calc.dart';
import 'package:bmi_calc/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  initTime ()async  {
    await Future.delayed(const Duration(seconds: 4) ,() {

        Navigator.push(context, MaterialPageRoute(builder: (context) => BmiCalc(),),);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bmi_Cacl_BG,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/bmi.png",height: 100,width: 100,),
                  SizedBox(height: 18,),
                  Text(
                    "BMI CALCULATOR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12,),
                  Text("Check your BMI",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
