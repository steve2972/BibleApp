import 'package:bible_app/Screens/MainNavigation.dart';
import 'package:bible_app/Screens/MenuScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  bool isUser() {
    //TODO: Check logic -> check what returns when mAuth.currentUser() is called
    return mAuth.currentUser() != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple Navigation',
      debugShowCheckedModeBanner: false,
      home: isUser() ? MainNavigation(): LoginScreen(),
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

