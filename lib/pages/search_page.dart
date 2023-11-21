import 'package:approject/customMaterials/bookRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customMaterials/MySearchBar.dart';
import '../customMaterials/dartServer/dartServer.dart';

class Search_page extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Search_page> {
  late List<String> books;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Future<void> init() async {
      String s = await Server.sendRequest("newBooks\n");
      books = s.split('\n');
    }
    init().then((value) => null);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: MySearchBar(controller),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),

          //body
          child: Column(
            children: [
              Text('categories:'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: onPressedCategories, child: Text('Fiction')),
                    SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: onPressedCategories,
                        child: Text('Nonfiction')),
                    SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: onPressedCategories, child: Text('Mystery')),
                    SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: onPressedCategories,
                        child: Text('Science Fiction')),
                    SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: onPressedCategories,
                        child: Text('Self-Help')),
                    SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: onPressedCategories, child: Text('History')),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              BookRow("books",books)
            ],
          ),
        ));
  }

  onPressedCategories() {
    print('ok');
  }
}
