import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/screens/activity_screen.dart';
import 'package:flutter_book_app/screens/create_post_screen.dart';
import 'package:flutter_book_app/screens/feed_screen.dart';
import 'package:flutter_book_app/screens/profile_screen.dart';
import 'package:flutter_book_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                'Book App',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            )),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            FeedScreen(),
            SearchScreen(),
            CreatePostScreen(),
            ActivityScreen(),
            ProfileScreen(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _currentTab = index;
            });
          },
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
          activeColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
              Icons.home,
              size: 32.0,
            )),
            BottomNavigationBarItem(
                icon: Icon(
              Icons.search,
              size: 32.0,
            )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
              Icons.notifications,
              size: 32.0,
            )),
            BottomNavigationBarItem(
                icon: Icon(
              Icons.account_circle,
              size: 32.0,
            )),
          ],
        ));
  }
}
