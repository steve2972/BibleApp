import 'package:flutter/material.dart';

class MainBookmark extends StatefulWidget {
  MainBookmark({Key key, this.title}): super(key: key);
  final String title;

  @override
  MainBookmarkState createState() => MainBookmarkState();
}

class MainBookmarkState extends State<MainBookmark> {
  final topBar = new AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0.0,
    title: Text("즐겨찾기"),
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: Container(color: Colors.white,),
    );
  }
}