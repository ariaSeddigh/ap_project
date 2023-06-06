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
    Image testImage = Image.asset('lib/dataBase/images/eBookImages/image2.jpeg',
        height: 300, fit: BoxFit.fill);
    Image HP1 = Image.asset('lib/dataBase/images/eBookImages/HP1.jpg',
        height: 300, fit: BoxFit.fill);
    Image HP2 = Image.asset('lib/dataBase/images/eBookImages/HP2.jpg',
        height: 300, fit: BoxFit.fill);

    List<Book_Cover> trendings = [
      Book_Cover(HP1, 'Harry Potter \nand the Chamber of Secrets', 'Harry Potter’s summer has included the worst birthday ever, doomy warnings from a house-elf called Dobby, and rescue from the Dursleys by his friend Ron Weasley in a magical flying car! Back at Hogwarts School of Witchcraft And Wizardry for his second year, Harry hears strange whispers echo through empty corridors – and then the attacks start. Students are found as though turned to stone … Dobby’s sinister predictions seem to be coming true.'),
      Book_Cover(
          HP2, 'Harry Potter \nand the Prisoner of Azkaban', 'When the Knight Bus crashes through the darkness and screeches to a halt in front of him, it’s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run – and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry’s tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss.'),
      Book_Cover(testImage, '1', 'description'),
      Book_Cover(testImage, '2', 'description'),
      Book_Cover(testImage, '3', 'description'),
      Book_Cover(testImage, '4', 'description'),
    ];
    List<Book_Cover> newBooks = trendings;

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
                              BookRow('new books', newBooks)
                            ]),
                      ),

                      //audiobooks page
                      SingleChildScrollView(
                        child: Column(children: [
                          Text('Audio books'),
                          SizedBox(height: 20),

                          //Trending books
                          BookRow('Trending audio books', trendings),

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
  }
}
