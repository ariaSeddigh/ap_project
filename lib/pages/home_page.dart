import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:approject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:approject/customMaterials/darkModeSwitch.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:approject/customMaterials/themes.dart';

import '../customMaterials/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var myTheme = themes();
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
          children: [
            //home page
            SafeArea(
              child: Container(
                //Tab bars
                child: Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: TabBar(
                            //labelColor: Theme.of(context).accentColor,
                            tabs: [
                              Tab(
                                child: Text('E-books'),
                                icon:
                                    Icon(Icons.menu_book, color: Colors.white),
                              ),
                              Tab(
                                child: Text('Audio books'),
                                icon:
                                    Icon(Icons.audio_file, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              //pdf book page
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
            ),

            //search page
            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    SafeArea(
                        child: Text(
                      'search page',
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
              ),
            ),

            //setting page
            SafeArea(
              child: Container(
                child: Column(children: [
                  SlidingSwitch(
                    value: false,
                    onChanged: (value) => {
                      //change theme mode
                    },
                    onTap: () {},
                    onSwipe: () {},
                    onDoubleTap: () {},
                    textOff: "dark",
                    textOn: "light",
                  ),
                  SizedBox(height: 15),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        backgroundColor: Theme.of(context).canvasColor,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
