import 'package:approject/customMaterials/signUpBox.dart';
import 'package:approject/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'signup_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              SignUpBox(),
            ],
          ),
        ),
      ),
    );
  }
}
