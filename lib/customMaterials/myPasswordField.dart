import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  MyPasswordField():hintText = 'Password';
  //overloaded constructor
  MyPasswordField.customHintText(this.hintText);
  String hintText;

  @override
  State<StatefulWidget> createState() => _MyPasswordField(hintText);
}

class _MyPasswordField extends State<MyPasswordField> {
  _MyPasswordField(this.hintText);
  bool passwordObscureText = true;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordObscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: passwordObscureText
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              passwordObscureText = !passwordObscureText;
            });
          },
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
