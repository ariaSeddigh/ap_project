import 'package:approject/customMaterials/bookRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customMaterials/bookCover.dart';

class Library_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _library_page();
}

class _library_page extends State<Library_page> {
  @override
  Widget build(BuildContext context) {
    Image HP1 = Image.asset('lib/dataBase/images/eBookImages/HP1.jpg',
        height: 300, fit: BoxFit.fill);
    Image HP2 = Image.asset('lib/dataBase/images/eBookImages/HP2.jpg',
        height: 300, fit: BoxFit.fill);
    List<Book_Cover> myBooks = [
      Book_Cover(HP1, 'Harry Potter \nand the Chamber of Secrets',
          'Harry Potter’s summer has included the worst birthday ever, doomy warnings from a house-elf called Dobby, and rescue from the Dursleys by his friend Ron Weasley in a magical flying car! Back at Hogwarts School of Witchcraft And Wizardry for his second year, Harry hears strange whispers echo through empty corridors – and then the attacks start. Students are found as though turned to stone … Dobby’s sinister predictions seem to be coming true.'),
      Book_Cover(HP2, 'Harry Potter \nand the Prisoner of Azkaban',
          'When the Knight Bus crashes through the darkness and screeches to a halt in front of him, it’s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run – and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry’s tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss.'),
    ];
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: SafeArea(
              child: Column(
            children: [
              BookRow(
                'my books:',myBooks
              )
            ],
          ))),
    );
  }
}
