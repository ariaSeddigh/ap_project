import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class User_information extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _userInformation();
}

class _userInformation extends State<User_information> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('lib/dataBase/images/eBookImages/image.jpg')),
              SizedBox(height: 30),
              Text(
                'Your Name',
              ),
              Text('credit: 10000\$'),
              SizedBox(height: 10),

              //buy credit
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 40),
                        backgroundColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text('buy credit')),
              ),
              //logout button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 40),
                        backgroundColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text('Log out')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
