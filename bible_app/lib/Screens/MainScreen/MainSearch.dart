import 'package:flutter/material.dart';

class MainSearch extends StatefulWidget {
  MainSearch({Key key, this.title}): super(key: key);
  final String title;

  @override
  MainSearchState createState() => MainSearchState();
}

class MainSearchState extends State<MainSearch> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(color: Colors.red,),
    );
  }
}