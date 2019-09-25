import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key, this.title}): super(key: key);
  final String title;

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(color: Colors.grey[50],),
    );
  }
}