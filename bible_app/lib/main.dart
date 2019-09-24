import 'package:bible_app/Screens/MainNavigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple Navigation',
      debugShowCheckedModeBanner: false,
      home: new MainNavigation(),
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          accentColor: Colors.blue[200],
          //primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black)
              ),
          textTheme: TextTheme(title: TextStyle(color: Colors.black))),
    );
  }
}

