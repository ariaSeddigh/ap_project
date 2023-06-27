import 'package:approject/customMaterials/ebook_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Book_Cover extends StatelessWidget {
  Book_Cover(Image this.coverImage, String this.bookName,String this.bookDescription);
  String bookDescription;
  Image coverImage ;
  String bookName;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => onClick(context),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15), child: coverImage),
              Text(this.bookName,textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );

  }

  void onClick(BuildContext context) {
    // print(this.bookName);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => eBookPage(coverImage,bookDescription,bookName)));
  }
}
