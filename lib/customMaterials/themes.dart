import 'package:flutter/material.dart';

class themes {
  ThemeData a = ThemeData(
    primaryColor: Colors.pink,
    accentColor: Color.fromARGB(255, 85, 79, 255),
    canvasColor: Color.fromARGB(255, 176, 171, 246),
    cardColor: Color.fromARGB(255, 134, 127, 255),
  );

  //light theme

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 144, 134, 255),
    accentColor: Color.fromARGB(255, 121, 107, 255),
    canvasColor: Color.fromARGB(255, 232, 241, 255),
    cardColor: Color.fromARGB(255, 247, 247, 255),
  );

  /*
  //light theme
    ThemeData light = ThemeData(
    primaryColor: Color.fromARGB(255, 246, 143, 136),
    accentColor: Color.fromARGB(255, 236, 106, 97),
    canvasColor: Color.fromARGB(255, 237, 240, 220),
    cardColor: Color.fromARGB(255, 188, 213, 213),
  );*/

  //dark theme

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
    primaryColor: Color.fromARGB(255, 1, 3, 24),
    accentColor: Color.fromARGB(255, 218, 89, 89),
    canvasColor: Color.fromARGB(255, 32, 33, 47),
    cardColor: Color.fromARGB(255, 45, 52, 61),
  );
}

