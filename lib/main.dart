import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Color.fromARGB(255, 89, 53, 252),
        canvasColor: Color.fromARGB(255, 176, 171, 246),
      ),
      home: LoginPage(),
    ); //MaterialApp
  }
}
