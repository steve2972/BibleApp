import 'package:flutter/material.dart';
import 'package:bible_app/Screens/main_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple Navigation',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black)
              ),
          textTheme: TextTheme(title: TextStyle(color: Colors.black))),
      home: new MainHomeScreen(),
    );
  }
}

