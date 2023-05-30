import 'package:flutter/cupertino.dart';

class Search_page extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _searchPage();
}

class _searchPage extends State<Search_page>{
  @override
  Widget build(BuildContext context) {
    return
      //search page
      SafeArea(
        child: Container(
          child: Column(
            children: [
              SafeArea(
                  child: Text(
                    'search page',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      );
  }
}