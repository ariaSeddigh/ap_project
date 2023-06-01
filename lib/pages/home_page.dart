import 'package:approject/customMaterials/bookRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customMaterials/bookCover.dart';

class Home_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homePage();
}

class _homePage extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    Image testImage = Image.asset('lib/dataBase/images/eBookImages/image.jpg');

    List<Book_Cover> trendings = [
      Book_Cover(testImage, '1'),
      Book_Cover(testImage, '2'),
      Book_Cover(testImage, '3'),
      Book_Cover(testImage, '4'),
      Book_Cover(testImage, '5'),
    ];
    List<Book_Cover> newBooks = [
      Book_Cover(testImage, '1'),
      Book_Cover(testImage, '2'),
      Book_Cover(testImage, '3'),
      Book_Cover(testImage, '4'),
      Book_Cover(testImage, '5'),
    ];


    return SafeArea(
      child: Container(
        //Tab bars
        child: Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Column(
                    children: [
                      TabBar(
                        //labelColor: Theme.of(context).accentColor,
                        tabs: [
                          Tab(
                            child: Text('E-books'),
                            icon: Icon(Icons.menu_book, color: Colors.white),
                          ),
                          Tab(
                            child: Text('Audio books'),
                            icon: Icon(Icons.audio_file, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      //pdf book page
                      SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('page1', textAlign: TextAlign.center),
                              SizedBox(height: 20),

                              //Trending books
                              BookRow('Trending books', trendings),

                              SizedBox(height: 20),

                              //new books
                              BookRow('new books', newBooks)
                            ]),
                      ),

                      //audiobooks page
                      Column(children: [
                        Text('page2'),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
