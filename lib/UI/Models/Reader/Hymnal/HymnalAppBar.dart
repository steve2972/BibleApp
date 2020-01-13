import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

Widget hymnalAppBar(BuildContext context) {
  return new AppBar(
    backgroundColor: Styles.LightAppBarColor,
    leading: IconButton(icon: Icon(Icons.arrow_back_ios), color: Colors.blue,
    onPressed: (){
      //FocusScope.of(context).requestFocus(FocusNode());
      Navigator.pop(context);
      },),
    elevation: 0,
  );
}