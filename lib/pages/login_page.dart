import 'package:approject/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:approject/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              //login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 40),
                        backgroundColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),

              //create new account link
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  'create new account',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
