import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ReaderAppBar extends StatelessWidget {
  const ReaderAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Styles.LightAppBarColor,
      pinned: true,
      elevation: 1.5,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 30, bottom: 13),
        title: Text("2 Timothy", style: Styles.mainText,),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(OMIcons.libraryBooks),
          color: Theme.of(context).brightness == Brightness.light ? Styles.lightIcon : Styles.darkIcon,
          onPressed: () {},
        ),
        IconButton(
            icon: Icon(Icons.more_vert),
            color: Styles.lightIcon,
            onPressed: (){},
          )
      ]
    );
  }
}