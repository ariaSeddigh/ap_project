import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'customMaterials/themes.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/foundation.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(create: (context) => AppData(),
      child: EasyDynamicThemeWidget(
        child: MyApp(),
      ),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    Image testImage = Image.asset('lib/dataBase/images/eBookImages/image.jpg');

    //bool isDark = false;
    var myTheme = themes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme.light,
      darkTheme: myTheme.dark,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      // home: eBookPage(),
      // home: Provider.of<AppData>(context).currentUser == 'default'? LoginPage(): HomePage(),
      // home: myPDF("name"),
      home:LoginPage(),

      /*if(Provider.of<AppData>(context).currentUser == '')
      {}*/
    ); //MaterialApp

  }

}


class AppData extends ChangeNotifier {
  bool logedIn = false;
  String currentUser = 'default';
  String credit = '0';

}

