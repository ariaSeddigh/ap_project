import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class Server{

  static Future<String> sendRequest(String request) async{
    String _request = request+"\u0000";
    return
      await Socket.connect("10.0.2.2", 8000).then((serverSocket) async {
        String finalResponse = 'Failed on dart server';
        serverSocket.write(_request);
        serverSocket.flush();

        serverSocket.listen((response) {
          String res = utf8.decode(response);
          finalResponse = res;
          print(res);
        });
        await Future.delayed(Duration(seconds: 1));
        return Future(() => finalResponse);
      })
    ;
  }



}