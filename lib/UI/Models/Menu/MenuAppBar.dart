import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/SettingsPage.dart';
import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

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
      title: Text("더보기", style: Styles.mainTextBlack,),
      actions: <Widget>[
        IconButton(
          icon: Icon(OMIcons.settings),
          color: Styles.lightIcon,
          onPressed: (){
            cupertinoNavigate(context, SettingsPage());
          },
        )
      ],
    );
  }
}