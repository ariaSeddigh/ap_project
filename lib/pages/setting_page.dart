import 'package:flutter/cupertino.dart';
import 'package:sliding_switch/sliding_switch.dart';

class Setting_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _settingPage();
}

class _settingPage extends State<Setting_page>{
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          child: Column(children: [
            SlidingSwitch(
              value: false,
              onChanged: (value) => {
                //change theme mode
              },
              onTap: () {},
              onSwipe: () {},
              onDoubleTap: () {},
              textOff: "dark",
              textOn: "light",
            ),
            SizedBox(height: 15),
          ]),
        ),
      );
  }
}