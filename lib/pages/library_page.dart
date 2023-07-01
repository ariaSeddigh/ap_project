import 'package:approject/customMaterials/bookRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customMaterials/bookCover.dart';
import '../customMaterials/dartServer/dartServer.dart';
import '../main.dart';

class Library_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _library_page();
}

class _library_page extends State<Library_page> {
  late List<String> myBooks = [];

  @override
  Widget build(BuildContext context) {
    Future<void> init() async {
      String userBooks = await Server.sendRequest("userBooks\n"+Provider.of<AppData>(context, listen: false).currentUser);
      myBooks = userBooks.split('\n');
      print('init');
    }
  init();
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: SafeArea(
              child: Column(
            children: [
              BookRow(
                  'myBooks',myBooks
              )
            ],
          ))),
    );
  }
}
