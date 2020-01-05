import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Styles.LightAppBarColor,
      elevation: 0.5,
      floating: true,
      title: Text("Church Life", style: Styles.mainText,),
      /*
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Theme.of(context).brightness == Brightness.light ? Styles.lightIcon : Styles.darkIcon,
        onPressed: () {},
      ),
      */  
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
          color: Styles.lightIcon,
        ),
        IconButton(
          icon: Icon(OMIcons.groupAdd),
          onPressed: (){},
          color: Styles.lightIcon,
        )
      ],
    );
  }
}