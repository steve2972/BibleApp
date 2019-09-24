import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  MainHome({Key key, this.title}): super(key: key);
  final String title;

  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(color: Colors.black,),
    );
  }
}