import 'package:approject/customMaterials/myPasswordField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/main_page.dart';
import '../pages/signup_page.dart';
import 'dartServer/dartServer.dart';

class LoginBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginBox();
}

class _LoginBox extends State<LoginBox> {
  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();
  bool passwordObscureText = true;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Login:",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),

            //Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _userNameController,
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
              child: MyPasswordField(_passWordController),
            ),

            SizedBox(height: 15),

            //login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: ElevatedButton(
                  onPressed: () {/*
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));*/
                    _logInButton();

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
            ),
          ],
        )
      ],
    );
  }
  void _logInButton(){
    String request = "login\n" +
        _userNameController.text +
        "\n" +
        _passWordController.text +
        "\n";
    Server.sendRequest(request);
  }

}
