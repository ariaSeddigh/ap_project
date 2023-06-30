import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

import '../main.dart';
import 'dartServer/dartServer.dart';
class eBookPage extends StatefulWidget {


  eBookPage(this.coverImage,this.description,this.bookName,this.price);
  Image coverImage = Image.asset('lib/dataBase/images/eBookImages/image.jpg');
  String description = 'this is description';
  String bookName = 'bookname';
  String price ;

  @override
  State<StatefulWidget> createState() => _eBookPage();
}


class _eBookPage extends State<eBookPage>{
  double rating = 0;
  double ratingFromServer = 0;
  void updateRates(){
    // ratingFromServer =
  }
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
                      child: widget.coverImage),
                ),
                Text(widget.bookName,style: TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('get this book:'),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: buyBook,
                        child: Text(widget.price.toString() + "\$"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                ),
                PannableRatingBar(rate: rating, items: List.generate(5, (index) =>
                const RatingWidget(
                    selectedColor: Colors.yellow,
                    unSelectedColor: Colors.grey,
                    child: Icon(
                      Icons.star,
                      size: 48,
                    ))),onChanged: (value){
                  setState(() {
                    rating = value;
                  });
                },),
                SizedBox(height: 20),
                PannableRatingBar(rate: ratingFromServer, items: List.generate(5, (index) =>
                const RatingWidget(
                    selectedColor: Colors.yellow,
                    unSelectedColor: Colors.grey,
                    child: Icon(
                      Icons.star,
                      size: 48,
                    ))),),
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
                        padding: EdgeInsets.all(10), child: Text(widget.description,style: TextStyle(height: 1.6),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void buyBook(){
    Server.sendRequest("buyBook\n"+Provider.of<AppData>(context,listen: false).currentUser+'\n'+widget.bookName+'\n'+widget.price);
  }

  void openPdf() async{
    /*String response = await Server.sendRequest("hasBook\n"+Provider.of<AppData>(context, listen: false).currentUser+"\n"+widget.bookName);
    await Future.delayed(Duration(milliseconds: 500));
    if(response=="ok"){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => myPDF(widget.bookName)));
    }*/

  }
}
