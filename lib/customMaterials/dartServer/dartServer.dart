import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class Server{

  static Future<String> sendRequest(String request) async{
     String _request = request+"\u0000";
     print('here1');
    return
     await Socket.connect("10.0.2.2", 8000).then((serverSocket) async {
       print('here2');
       String finalResponse = 'Failed';
       serverSocket.write(_request);
       serverSocket.flush();

       serverSocket.listen((response) {
         String res = utf8.decode(response);
         print("response :::::::");
        finalResponse = res;
         print(res);
         print("finalResponse1:"+finalResponse);
       });
       await Future.delayed(Duration(milliseconds: 500));
       print("finalResponse2:"+finalResponse);
       return Future(() => finalResponse);
     })
     ;
  }
  
  
  
}
