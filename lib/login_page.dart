import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 195, 246),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //Hello
              Text(
                "*appName*",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 150),
              Text(
                "Login:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),

              //email textField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 214, 214, 246),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //password textField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 214, 214, 246),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              //button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 89, 53, 252)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),

              //sign up link
              Text(
                'create new account',
                style: TextStyle(
                  color: Color.fromARGB(148, 89, 53, 252),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
