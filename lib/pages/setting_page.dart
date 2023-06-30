import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../customMaterials/userInformation.dart';

class Setting_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _settingPage();
}

class _settingPage extends State<Setting_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(children: [
          SizedBox(height: 20),
          User_information(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
                onPressed: () {
                  EasyDynamicTheme.of(context).changeTheme();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 40),
                    backgroundColor: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text('dark/light mode')),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 40),
                    backgroundColor: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text('Upgrade account')),
          ),
          SizedBox(height: 5),

        ]),
      ),
    );
  }
}
