import 'package:flutter/material.dart';

class outputText extends StatelessWidget {
  const outputText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: const Text("Your BMI Age is:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )));
  }
}
