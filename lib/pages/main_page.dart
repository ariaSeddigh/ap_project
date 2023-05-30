import 'package:approject/pages/setting_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:approject/customMaterials/themes.dart';
import 'package:approject/pages/search_page.dart';
import 'package:approject/pages/home_page.dart';

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
            Home_page(),

            Search_page(),
            //setting page
            Setting_page(),
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
