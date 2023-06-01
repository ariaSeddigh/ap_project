import 'package:flutter/cupertino.dart';

class Book_Cover extends StatelessWidget {
  Book_Cover(Image this.coverImage, String this.bookName) {}
  Image coverImage;
  String bookName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15), child: coverImage),
            Text(this.bookName)
          ],
        ),
      ),
    );
  }
}
