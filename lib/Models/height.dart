import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  const Height({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0, left: 10.0),
        child: const Text("Your Height in Cm:",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            )));
  }
}
