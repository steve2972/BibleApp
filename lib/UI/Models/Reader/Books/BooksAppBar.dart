import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

Widget booksAppBar(BuildContext context){
    return AppBar(
      elevation: 1,
      title: Text("Spiritual Books", style: TextStyle(color: Colors.blue)),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          color: Colors.blue,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Styles.LightAppBarColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
            color: Styles.lightIcon,
          ),
          IconButton(
            icon: Icon(OMIcons.shoppingCart),
            onPressed: (){},
            color: Styles.lightIcon,
          )
        ],
    );
}