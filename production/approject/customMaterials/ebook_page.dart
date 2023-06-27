import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eBookPage extends StatelessWidget {
  eBookPage(this.coverImage,this.description,this.bookName);
  Image coverImage = Image.asset('lib/dataBase/images/eBookImages/image.jpg');
  String description = 'this is description';
  String bookName = 'bookname';
  int price = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //cover image
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: coverImage),
                ),
                Text(bookName,style: TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('get this book:'),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(this.price.toString() + "\$"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Description:')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: EdgeInsets.all(10), child: Text(description,style: TextStyle(height: 1.6),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
