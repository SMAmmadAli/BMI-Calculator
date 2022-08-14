import 'package:bmi_calculator/Models/Weight.dart';
import 'package:bmi_calculator/Models/button.dart';
import 'package:bmi_calculator/Models/bmi_age.dart';
import 'package:bmi_calculator/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/height.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentindex = 0;
  String result = '';

  TextEditingController heightController = TextEditingController();
  TextEditingController WeightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.home,),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.settings),
              )
            ],
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        MaleFemale(Icons.male, Colors.blue, 0),
                        MaleFemale(Icons.female, Colors.pink, 1),
                      ]),
                      Height(),
                      Container(
                          child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        decoration: InputDecoration(
                            hintText: "Your Height in Cm",
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            )),
                      )),
                      Weight(),
                      Container(
                          child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: WeightController,
                        decoration: InputDecoration(
                            hintText: "Your Weight in Kg",
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            )),
                      )),
                      InkWell(
                          onTap: () {
                            double height =
                                double.parse(heightController.value.text);
                            double weight =
                                double.parse(WeightController.value.text);
                            calculateBmi(height, weight);
                          },
                          child: ButtonCal()),
                      const SizedBox(height: 20.0),
                      outputText(),
                      Container(
                          width: double.infinity,
                          child: Text("$result",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  )))),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget MaleFemale(IconData icon, Color color, int index) {
    // var icon;
    return Expanded(
        child: InkWell(
      onTap: () {
        // when the click the button the index will have the value of the Animatedcontainer index
        changeIndex(index);
      },
      child: AnimatedContainer(
        height: 100.0,
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: currentindex == index ? color : Colors.grey[200],
        ),
        child: Icon(
          icon,
          size: 60.0,
          color: currentindex == index ? Colors.white : color,
        ),
      ),
    ));
  }
}
