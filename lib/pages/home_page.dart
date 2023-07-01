import 'package:approject/customMaterials/bookRow.dart';
import 'package:approject/customMaterials/dartServer/dartServer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customMaterials/bookCover.dart';

class Home_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homePage();
}

class _homePage extends State<Home_page> {
  List<String> newBooks = [];
/*
  @override
  Future<void> initState() async {
    String newBooksString = await Server.sendRequest("newBooks\n");
    newBooksList = newBooksString.split('\n');
    //await Future.delayed(Duration(milliseconds: 500));
    print('newbooks String:' + newBooksString);
    print('newbooks:' + newBooksList[1]);

    super.initState();
  }*/

  /*@override
  Widget build(BuildContext context) {
    Image testImage = Image.asset('lib/dataBase/images/eBookImages/image2.jpeg',
        height: 300, fit: BoxFit.fill);
    Image HP1 = Image.asset('lib/dataBase/images/eBookImages/HP1.jpg',
        height: 300, fit: BoxFit.fill);
    Image HP2 = Image.asset('lib/dataBase/images/eBookImages/HP2.jpg',
        height: 300, fit: BoxFit.fill);

    */ /*List<Book_Cover> trendings = [
      // Book_Cover('Harry Potter and the Chamber of Secrets'),
      Book_Cover('test'),
      Book_Cover(
          HP2, 'Harry Potter \nand the Prisoner of Azkaban', 'When the Knight Bus crashes through the darkness and screeches to a halt in front of him, it’s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run – and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry’s tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss.'),
      Book_Cover(testImage, '1', 'description'),
      Book_Cover(testImage, '2', 'description'),
      Book_Cover(testImage, '3', 'description'),
      Book_Cover(testImage, '4', 'description'),
    ];*/ /*
    List<String> trendings = ["test","test"];
    List<String> newBooks = newBooksList;

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
                              Text('E-books', textAlign: TextAlign.center),
                              SizedBox(height: 20),

                              //Trending books
                              //BookRow('Trending books', trendings),

                              SizedBox(height: 20),

                              //new books
                              BookRow('new books', newBooks)
                            ]),
                      ),

                      //audiobooks page
                      SingleChildScrollView(
                        child: Column(children: [
                          Text('Audio books'),
                          SizedBox(height: 20),

                          //Trending books
                          //BookRow('Trending audio books', trendings),

                          SizedBox(height: 20),

                          //new books
                          BookRow('new audio books', newBooks)
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    List<String> trendings = ["test","hp3",];
    //List<Book_Cover> newBooks = trendings;

    Future<void> init() async {
      String newBooksString = await Server.sendRequest("newBooks\n");
      newBooks = newBooksString.split('\n');
      //await Future.delayed(Duration(milliseconds: 500));
      print('newbooks String:' + newBooksString);
      print('newbooks:' + newBooks[1].trim()+'R');
    }
    init().then((value) => null);
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
                              Text('E-books', textAlign: TextAlign.center),
                              SizedBox(height: 20),

                              //Trending books
                              BookRow('Trending books', trendings),

                              SizedBox(height: 20),

                              //new books
                              BookRow('new books', newBooks),

                            ]),
                      ),

                      //audiobooks page
                      SingleChildScrollView(
                        child: Column(children: [
                          Text('Audio books'),
                          SizedBox(height: 20),

                          //Trending books
                          //BookRow('Trending audio books', trendings),

                          SizedBox(height: 20),

                          //new books
                          //BookRow('new audio books', newBooks)
                        ]),
                      ),
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
