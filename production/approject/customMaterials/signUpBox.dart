import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/main_page.dart';

class SignUpBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signUpBox();
}

class _signUpBox extends State<SignUpBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign Up:",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 30),

        //username
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).cardColor,
              hintText: "Username",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),

        SizedBox(height: 10),
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
          child: MyPasswordField(),
        ),

        SizedBox(height: 15),
        //re-enter password
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyPasswordField.customHintText('Confirm Password')),

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
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 0),

        //create new account link
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
