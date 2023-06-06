import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MySearchBar();
}

class _MySearchBar extends State<MySearchBar>{
  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    TextEditingController _searchController = TextEditingController();
    return TextField(
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
            print('sds');
          },
        ),
      ),
    );
  }
}