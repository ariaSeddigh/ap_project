import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  MyPasswordField(this.controller):hintText = 'Password';
  MyPasswordField.withCustomHintText(this.controller,this.hintText);
  TextEditingController controller;
  String hintText;
  @override
  State<StatefulWidget> createState() => _MyPasswordField();
}

class _MyPasswordField extends State<MyPasswordField> {
  bool passwordObscureText = true;
  final _passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}