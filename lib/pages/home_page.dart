import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homePage();
}

class _homePage extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //Tab bars
        child: Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: TabBar(
                    //labelColor: Theme.of(context).accentColor,
                    tabs: [
                      Tab(
                        child: Text('E-books'),
                        icon: Icon(Icons.menu_book, color: Colors.white),
                      ),
                      Tab(
                        child: Text('Audio books'),
                        icon: Icon(Icons.audio_file, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      //pdf book page
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('page1', textAlign: TextAlign.center),
                            SizedBox(height: 20),

                            //Trending books
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Trending books',
                                        textAlign: TextAlign.left,
                                      ),
                                      Opacity(
                                        child: Text('see more',
                                            textAlign: TextAlign.right),
                                        opacity: 0.5,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20),

                            //new books
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'new books',
                                        textAlign: TextAlign.left,
                                      ),
                                      Opacity(
                                        child: Text('see more',
                                            textAlign: TextAlign.right),
                                        opacity: 0.5,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),

                      //audiobooks page
                      Column(children: [
                        Text('page2'),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
