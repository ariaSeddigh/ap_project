import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'customMaterials/themes.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    var myTheme = themes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme.light,
      darkTheme: myTheme.dark,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: LoginPage(),
    ); //MaterialApp

  }

}
