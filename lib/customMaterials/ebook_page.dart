import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eBookPage extends StatelessWidget {
  Image coverImage = Image.asset('lib/dataBase/images/eBookImages/image.jpg');
  Text description = Text('ddddd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), child: coverImage),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("buy"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).accentColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                    alignment: Alignment.bottomLeft, child: Text('Description:')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child:
                      Padding(padding: EdgeInsets.all(10), child: description),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
