import 'package:approject/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:approject/pages/signup_page.dart';
import 'package:provider/provider.dart';

import '../customMaterials/LoginBox.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    /*if(Provider.of<AppData>(context).currentUser == '')
      {}*/
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "*appName*",
                style: TextStyle(fontSize: 25),
              ),
              LoginBox(),
            ],
          ),
        ),
      ),
    );
  }
}
