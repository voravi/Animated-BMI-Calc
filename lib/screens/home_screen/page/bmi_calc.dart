import 'package:bmi_calc/screens/caclulated_bmi.dart';
import 'package:bmi_calc/utils/colors.dart';
import 'package:bmi_calc/utils/string_utiles.dart';
import 'package:bmi_calc/utils/style_utiles.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  double hGht = 0;
  int Wght = 0;
  int age = 0;

  double total = 0.0;
  double heightInMeter = 0;
  bool maleSelected = false;
  bool femaleSelected = false;

  double bmi = 0;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightController.text = Wght.toString();
    heightController.text = age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bmi_Cacl_BG,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        bmiCalculator,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // TODO : 1st One
                        Expanded(
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 1),
                            tween: Tween<Offset>(begin: Offset(-80, 0), end: Offset(0, 0)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  femaleSelected = !femaleSelected;
                                  maleSelected = false;
                                });
                              },
                              child: Container(
                                height: 182,
                                decoration: containersDecoration,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: (femaleSelected)
                                          ? Image.asset(
                                              "assets/images/woman.png",
                                              height: 120,
                                              width: 120,
                                              color: maleRedColor,
                                            )
                                          : Image.asset(
                                              "assets/images/woman.png",
                                              height: 120,
                                              width: 120,
                                            ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: (femaleSelected)
                                          ? Text(
                                              "Female",
                                              style: font_size_20_Color_white.copyWith(color: maleRedColor),
                                            )
                                          : Text(
                                              "Female",
                                              style: font_size_20_Color_white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            builder: (context, dynamic value, widget) {
                              return Transform.translate(
                                offset: value,
                                child: widget,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        // TODO : 2nd One
                        Expanded(
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 1),
                            tween: Tween<Offset>(begin: Offset(160, 0), end: Offset(0, 0)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  maleSelected = !maleSelected;
                                  femaleSelected = false;
                                });
                              },
                              child: Container(
                                height: 182,
                                decoration: containersDecoration.copyWith(
                                  color: maleContainer,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: (maleSelected)
                                          ? Image.asset(
                                              "assets/images/male.png",
                                              height: 120,
                                              width: 120,
                                            )
                                          : Image.asset(
                                              "assets/images/male.png",
                                              height: 120,
                                              width: 120,
                                              color: colorwhite,
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: (maleSelected)
                                          ? Text(
                                              "Male",
                                              style: font_size_20_Color_white.copyWith(
                                                color: maleRedColor,
                                              ),
                                            )
                                          : Text("Male", style: font_size_20_Color_white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            builder: (context, dynamic value, widget) {
                              return Transform.translate(
                                offset: value,
                                child: widget,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // TODO : 3rd One
                    TweenAnimationBuilder(
                      duration: Duration(seconds: 1),
                      tween: Tween<Offset>(begin: Offset(160, 0), end: Offset(0, 0)),
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: containersDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Text(
                                height,
                                style: font_size_14_Color_dark,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${hGht.toInt().toString()}",
                                    style: font_size_40_bold.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " cm",
                                    style: font_size_14_Color_dark,
                                  ),
                                ],
                              ),
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 1,
                                activeTrackColor: sliderTrack1,
                                inactiveTrackColor: sliderTrack2,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 7.5,
                                ),
                              ),
                              child: Slider(
                                min: 0,
                                max: 300,
                                value: hGht,
                                thumbColor: sliderButton,
                                onChanged: (sliderData) {
                                  hGht = sliderData;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      builder: (context, dynamic value, widget) {
                        return Transform.translate(
                          offset: value,
                          child: widget,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // LAST ROW......

                    Row(
                      children: [
                        // TODO : 4th One
                        Expanded(
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 1),
                            tween: Tween<Offset>(begin: Offset(-80, 0), end: Offset(0, 0)),
                            child: Container(
                              height: 180,
                              decoration: containersDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      weight,
                                      style: font_size_20_Color_white.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    child: TextFormField(
                                      controller: weightController,
                                      textAlign: TextAlign.center,
                                      style: font_size_40_bold.copyWith(
                                        fontSize: 45,
                                      ),
                                      onFieldSubmitted: (data) {
                                        Wght = int.parse(data);
                                        // log(Wght.toString(),name: "Hii");
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        hintText: "0",
                                        border: InputBorder.none,
                                        hintStyle: font_size_40_bold.copyWith(
                                          fontSize: 45,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: minus_Button,
                                            onPressed: () {
                                              if (Wght > 0) {
                                                Wght--;
                                                weightController.text = Wght.toString();
                                                setState(() {});
                                              } else {}
                                            },
                                            child: Icon(Icons.remove),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 13,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: plus_Button,
                                            onPressed: () {
                                              Wght++;
                                              weightController.text = Wght.toString();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: plus_icon_Color,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (context, dynamic value, widget) {
                              return Transform.translate(
                                offset: value,
                                child: widget,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        // TODO : 5th One
                        Expanded(
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 1),
                            tween: Tween<Offset>(begin: Offset(160, 0), end: Offset(0, 0)),
                            child: Container(
                              height: 180,
                              decoration: containersDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Age",
                                      style: font_size_20_Color_white.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: TextFormField(
                                      controller: heightController,
                                      textAlign: TextAlign.center,
                                      style: font_size_40_bold.copyWith(
                                        fontSize: 45,
                                      ),
                                      onFieldSubmitted: (data) {
                                        age = int.parse(data);
                                        // log(Hght.toString(),name: "Hii");
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        hintText: "0",
                                        border: InputBorder.none,
                                        hintStyle: font_size_40_bold.copyWith(
                                          fontSize: 45,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: minus_Button,
                                            onPressed: () {
                                              if (age > 0) {
                                                age--;
                                                heightController.text = age.toString();
                                                setState(() {});
                                              } else {}
                                            },
                                            child: const Icon(Icons.remove),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 13,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            backgroundColor: plus_Button,
                                            onPressed: () {
                                              age++;
                                              heightController.text = age.toString();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: plus_icon_Color,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (context, dynamic value, widget) {
                              return Transform.translate(
                                offset: value,
                                child: widget,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (femaleSelected == true || maleSelected == true) {
                    if (hGht > 0 && age > 0 && int.parse(weightController.text) > 0) {
                       heightInMeter = hGht / 100;
                       bmi = Wght / (heightInMeter * heightInMeter);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalculatedBMI(bmi: bmi),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Enter valid parameters",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          backgroundColor: bmi_Cacl_BG,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Select Male / Female",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        backgroundColor: bmi_Cacl_BG,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: sliderButton,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      calculate,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: colorwhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
