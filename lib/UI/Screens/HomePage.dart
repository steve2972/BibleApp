import 'package:bible_test2/UI/Screens/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class Destination {
  Destination(this.title, this.icon, this.route);
  final String title;
  final IconData icon;
  final Widget route;
}

List<Destination> allDestinations = <Destination>[
  Destination('Reader', OMIcons.home, ReaderPage()),
  Destination('Profile', CupertinoIcons.profile_circled, ProfilePage()),
  Destination('Menu', Icons.menu, MenuPage()),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return destination.route;
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            title: Text(destination.title)
          );
        }).toList(),
      ),
    );
  }
}