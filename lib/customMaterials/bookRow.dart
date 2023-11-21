import 'package:flutter/cupertino.dart';
import 'package:approject/customMaterials/bookCover.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {
  BookRow(String this.name, List<String> this.RowChildren) {

  }
  List<String> RowChildren;
  String name;
  @override
  Widget build(BuildContext context) {
    List<Book_Cover> list = toBookCoverList(RowChildren);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          //Trending books column
          Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: seeMore,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          this.name,
                          textAlign: TextAlign.left,
                        ),
                        Opacity(
                          child: Text('see more', textAlign: TextAlign.right),
                          opacity: 0.5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).accentColor),
                  //books row
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: list),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  seeMore() {
    //Todo
    print('see more');
  }

  List<Book_Cover> toBookCoverList(List<String> rowChildren) {
    List<Book_Cover> list = [];
    for(int i=0;i<rowChildren.length;i++){
      list.add(Book_Cover(RowChildren[i]));
      print("list object:"+RowChildren[i]+"spaceChack");
    }
    return list;
  }
}
