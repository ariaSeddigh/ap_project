import 'package:flutter/cupertino.dart';
import 'package:approject/customMaterials/bookCover.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget{

  BookRow(String this.name,List<Book_Cover> this.RowChildren){

  }
  List<Book_Cover> RowChildren;
  String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          //Trending books column
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending books',
                      textAlign: TextAlign.left,
                    ),
                    Opacity(
                      child: Text('see more',
                          textAlign: TextAlign.right),
                      opacity: 0.5,
                    )
                  ],
                ),
              ),
              ClipRRect(borderRadius: BorderRadius.circular(15),
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor),
                    //books row
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10),
                      child: SingleChildScrollView(
                        scrollDirection:
                        Axis.horizontal,
                        child: Row(children: this.RowChildren),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}