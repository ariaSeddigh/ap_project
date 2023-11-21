/*import 'package:approject/customMaterials/ebook_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Book_Cover extends StatelessWidget {
  Book_Cover(String this.bookName);

  String bookName;


  @override
  Widget build(BuildContext context) {
    Image coverImage = Image.asset(('lib/dataBase/books/eBooks/'+bookName+'.jpg'),
        height: 300, fit: BoxFit.fill);
    String bookDescription = await readFileAsString('lib/dataBase/books/eBooks/'+bookName+'.txt');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => onClick(context,coverImage,bookDescription),
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

  void onClick(BuildContext context,Image coverImage,String bookDescription) {
    // print(this.bookName);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => eBookPage(coverImage,bookDescription,bookName)));
  }

  Future<String> readFileAsString(String filePath) async {
    try {
      final file = File(filePath);
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      print('Error reading file: $e');
      return "default";
    }
  }
}*/
import 'dart:io';

import 'package:approject/customMaterials/dartServer/dartServer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ebook_page.dart';

class Book_Cover extends StatefulWidget {
  final String bookName;

  Book_Cover(this.bookName);

  @override
  _BookCoverState createState() => _BookCoverState();
}

class _BookCoverState extends State<Book_Cover> {
  late Image coverImage;
  late String bookDescription;
  late String price;

  @override
  void initState() {
    super.initState();
    coverImage = Image.asset(
      'lib/dataBase/books/eBooks/${widget.bookName.trim()}/coverImage.jpg',
      height: 300,
      fit: BoxFit.fill,
    );
    loadBookDescription(widget.bookName);
  }

  void loadBookDescription(String bookName) async {
    bookDescription = await Server.sendRequest("bookDescription\n"+bookName);
    price = await Server.sendRequest("bookPrice\n"+bookName);
  }

  @override
  Widget build(BuildContext context) {
    loadBookDescription(widget.bookName);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => onClick(context),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: coverImage,
              ),
              Text(widget.bookName, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  void onClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => eBookPage(coverImage, bookDescription, widget.bookName,price),
      ),
    );
  }
}
