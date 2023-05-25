import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
                child: Column(
                  children: [
                    Text(
                      'home page',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
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
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  ElevatedButton(onPressed: () {}, child: null),
                  ElevatedButton(onPressed: () {}, child: null),
                  ElevatedButton(onPressed: () {}, child: null),
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
