import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidgets {
  Widget darkModeSwitch(bool isDark, Function onChange) {
    return Padding(
        padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('dark/light mode'),
            CupertinoSwitch(
                trackColor: CupertinoColors.darkBackgroundGray,
                activeColor: CupertinoColors.white,
                value: isDark,
                onChanged: (newValue) {
                  onChange(newValue);
                })
          ],
        ));
  }
}
