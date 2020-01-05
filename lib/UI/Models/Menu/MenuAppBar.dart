import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Styles.LightAppBarColor,
      elevation: 0.5,
      floating: false,
      title: Text("Menu", style: Styles.mainTextBlack,),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
          color: Styles.lightIcon,
        ),
      ],
    );
  }
}