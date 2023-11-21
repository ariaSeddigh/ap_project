import 'package:approject/customMaterials/dartServer/dartServer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/login_page.dart';
import 'package:approject/main.dart';

class User_information extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _userInformation();
}

class _userInformation extends State<User_information> {

  final _creditController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getCredit();

  }
  @override
  Widget build(BuildContext context) {
    print('ok1');
    getCredit();
    Future.delayed(Duration(milliseconds: 500));
    String credit = Provider.of<AppData>(context, listen: false).credit;
    print('ok2');
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                  radius: 50,
                  /*backgroundImage:
                      AssetImage('lib/dataBase/images/eBookImages/image.jpg')*/),
              SizedBox(height: 30),
              Text(
                Provider.of<AppData>(context, listen: false).currentUser,
              ),
              Text('credit: ${credit}\$' ),
              SizedBox(height: 10),

              //buy credit
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Inter the amount:"),
                            actions: [TextFormField(controller: _creditController,),TextButton(onPressed: (){
                              Server.sendRequest("addCredit\n"+Provider.of<AppData>(context, listen: false).currentUser+"\n"+_creditController.text);
                              Navigator.of(context).pop();
                            }, child: Text("ok"))],
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 40),
                        backgroundColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text('buy credit')),
              ),
              //logout button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 40),
                        backgroundColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text('Log out')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCredit() async {
    // String value = await Server.sendRequest("credit\n"+Provider.of<AppData>(context).currentUser);
    String value = await Server.sendRequest('credit\n${Provider.of<AppData>(context, listen: false).currentUser}');
    Provider.of<AppData>(context, listen: false).credit = value;
    print('val is: $value');
    //await Future.delayed(Duration(seconds: 2));
    setState(() {
    });

  }

}
