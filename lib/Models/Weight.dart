import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0, left: 10.0),
        child: const Text("Your Weight in Kg:",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            )));
  }
}
