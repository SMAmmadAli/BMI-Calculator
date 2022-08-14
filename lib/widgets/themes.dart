import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: darkbluish,
      secondaryHeaderColor: Colors.white,
      cardColor: Colors.white,
      canvasColor: creameColor,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkCreameColor,
        primaryColor: lightbluish,
        secondaryHeaderColor: Colors.white,
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white)),
      );

  static Color creameColor = const Color(0xfff5f5f5);
  static Color darkbluish = const Color(0xff403b58);
  static Color lightbluish = Colors.indigo.shade500;
  static Color darkCreameColor = Colors.grey.shade900;

}
