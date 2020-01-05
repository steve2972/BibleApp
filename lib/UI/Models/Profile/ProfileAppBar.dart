import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.orange[800],
      elevation: 0,
      floating: false,
      pinned: false,
      title: Text("송재헌 형제", style: TextStyle(color: Colors.white),),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(OMIcons.edit),
          onPressed: (){},
          color: Colors.white,
        ),
      ],
    );
  }
}