import 'package:flutter/material.dart';

class ButtonCal extends StatelessWidget {
  const ButtonCal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
                fontWeight: FontWeight.w400)));
  }
}
