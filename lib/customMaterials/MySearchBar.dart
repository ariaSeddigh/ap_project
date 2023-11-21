import 'package:approject/customMaterials/bookCover.dart';
import 'package:approject/customMaterials/bookRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dartServer/dartServer.dart';

class MySearchBar extends StatefulWidget{
  MySearchBar(this.controller);
  TextEditingController controller;
  @override
  State<StatefulWidget> createState() => _MySearchBar();
}

class _MySearchBar extends State<MySearchBar>{
  late String books;
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Future<void> init() async {
      books = await Server.sendRequest("newBooks\n");
    }
    init().then((value) => null);
    FocusNode _focusNode = FocusNode();
    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: 'search',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookRow("search result", [controller.text])));
            print("books: "+books);
            if(controller.text.length != 0){
              print('searching');

            }
          },
        ),
      ),
    );
  }
}