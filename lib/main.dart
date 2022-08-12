import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/themes.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'BMI Calculator',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0.0,
            backgroundColor: const Color(0xfffafafa),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black45,
                ),
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
                  Container(
                      margin: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: const Text("Your Height in Cm:",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ))),
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
                  Container(
                      margin: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: const Text("Your Weight in Kg:",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ))),
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
                    onTap: (){
                      double height = double.parse(heightController.value.text);
                      double weight = double.parse(WeightController.value.text);
                      calculateBmi(height, weight);
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(top: 10.0),
                      alignment: Alignment.center,
                      height: 50.0,
                      width: double.infinity,
                      color: Colors.indigoAccent,
                      duration: Duration(seconds: 1),
                      child: const Text("Calculate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400 
                                  ),
                      ))),
                 const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Your BMI Age is:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "$result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )))
                ],
              ),
            ),
          )),
    );
  }

  void calculateBmi(double height, double weight){
    double finalresult = weight / (height * height / 10000 );
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
