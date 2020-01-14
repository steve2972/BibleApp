import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

Widget commonAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Styles.LightAppBarColor,
    title: Text(title, style: TextStyle(color: Colors.black),),
    leading: IconButton(icon: Icon(Icons.arrow_back_ios), color: Styles.lightIcon, onPressed: (){Navigator.pop(context);},),
    elevation: 0.5,
  );
}