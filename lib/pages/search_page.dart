import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*

class Search_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _searchPage();
}

class _searchPage extends State<Search_page> {
  @override
  Widget build(BuildContext context) {
    return
        //search page
        SafeArea(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Text(
                'search page',
                style: TextStyle(fontSize: 20),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
*/

class Search_page extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Search_page> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: TextField(
            focusNode: _focusNode,
            controller: _searchController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'search',
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  //hide keyboard
                  _focusNode.unfocus();
                },
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),

          //body
          child: Column(
            children: [],
          ),
        ));
  }
}
