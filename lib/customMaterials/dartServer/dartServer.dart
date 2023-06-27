import 'dart:io';

class Server{

  static void sendRequest(String request) async{
     String _request = "logOut\n"+request+"\u0000";
     await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
     //await Socket.connect("192.168.1.35", 8000).then((serverSocket) {
       serverSocket.write(_request);
       serverSocket.flush();
       serverSocket.listen((response) {
         print(String.fromCharCodes(response));
       });
     }
     );
  }
}