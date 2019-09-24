import 'package:flutter/material.dart';

class MainBookmark extends StatefulWidget {
  MainBookmark({Key key, this.title}): super(key: key);
  final String title;

  @override
  MainBookmarkState createState() => MainBookmarkState();
}

class MainBookmarkState extends State<MainBookmark> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(color: Colors.yellowAccent,),
    );
  }
}