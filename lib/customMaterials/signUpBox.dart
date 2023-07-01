import 'package:approject/customMaterials/dartServer/dartServer.dart';
import 'package:approject/customMaterials/myPasswordField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/main_page.dart';

class SignUpBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signUpBox();
}

class _signUpBox extends State<SignUpBox> {
  final _userNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passWordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool passwordObscureText = true;
    bool confirmPasswordObscureText = true;
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
            controller: _userNameController,
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
            controller: _emailAddressController,
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
        //re-enter password
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyPasswordField.withCustomHintText(
                _confirmPasswordController, 'Confirm password')),

        SizedBox(height: 15),

        //login button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            child: ElevatedButton(
              onPressed: _signInButton,
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

  //invalid email pop up
  Future invalidInput(String text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(text),
            actions: [TextButton(onPressed: okButton, child: Text("ok"))],
          ));

  void okButton() {
    Navigator.of(context).pop();
    //_signInButton();
  }

  void _signInButton() {
    /*
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));*/
    if (!_emailAddressController.text.contains("@")) {
      invalidInput("Invalid Email!");
      return;
    }
    if (_passWordController.text != _confirmPasswordController.text) {
      invalidInput("confirm password and password does not match!");
      return;
    }
    if (_passWordController.text.length <8) {
      invalidInput("password must be at least 8 characters!");
      return;
    }

    String request = "signup\n" +
        _userNameController.text +
        "\n" +
        _emailAddressController.text +
        "\n" +
        _passWordController.text +
        "\n";
    Server.sendRequest(request);
  }
}
