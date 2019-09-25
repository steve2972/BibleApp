import 'package:flutter/material.dart';

class MainSearch extends StatefulWidget {
  MainSearch({Key key, this.title}): super(key: key);
  final String title;

  @override
  MainSearchState createState() => MainSearchState();
}

class MainSearchState extends State<MainSearch> {
  final topBar = new AppBar(
    backgroundColor: Colors.grey[50],
    centerTitle: true,
    elevation: 0.0,
    title: Text("검색"),
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: Container(color: Colors.grey[50],),
    );
  }
}