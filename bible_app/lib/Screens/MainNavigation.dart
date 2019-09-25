import 'package:flutter/material.dart';
import 'package:bible_app/Screens/MainScreen/MainHome.dart';
import 'package:bible_app/Screens/MainScreen/MainSearch.dart';
import 'package:bible_app/Screens/MainScreen/MainBookmarks.dart';


class MainNavigation extends StatefulWidget {
  MainNavigation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MainNavigationState createState() =>MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  PageController _pageController;
  var _page = 0;

  final List<Widget> _children = [
   MainHome(),
   MainSearch(),
   MainBookmark(),
 ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: PageView(
        children: _children,
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
        bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("홈"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("검색"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text("즐겨찾기"),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}