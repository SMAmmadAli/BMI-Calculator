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
                      child: const Text("Your Age in Cm:",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ))),
                  Container(
                      child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Your height in Cm", fillColor: Colors.grey),
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Your Weight in Kg", fillColor: Colors.grey),
                  )),
                  InkWell(
                    onTap: (){},
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(top: 40.0),
                      alignment: Alignment.center,
                      height: 50.0,
                      width: 100.0,
                      color: Colors.indigoAccent,
                      duration: Duration(seconds: 1),
                      child: Text("Calculate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400 
                                  ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
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
        height: 80.0,
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
