import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'customMaterials/themes.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    var myTheme = themes();
    return ThemeProvider(
      initTheme: myTheme.light,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: isDark?myTheme.dark:myTheme.light,
        home: LoginPage(),
      ),
    ); //MaterialApp

  }

}
