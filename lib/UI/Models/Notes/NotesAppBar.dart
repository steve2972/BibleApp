import 'package:bible_test2/UI/Screens/NotesPage/NoteEditPage.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Styles.LightAppBarColor,
      elevation: 1,
      pinned: true,
      //centerTitle: true,
      expandedHeight: 150.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 75, bottom: 10),
        title: Text("Notes", style: Styles.mainText),
      ),

      leading: IconButton(
          icon: Icon(OMIcons.settings),
          color: Styles.lightIcon,
          onPressed: () {},
        ),

      actions: <Widget>[
        IconButton(
          icon: Icon(OMIcons.checkBox),
          color: Styles.lightIcon,
          onPressed: () {},
        ),
        
        IconButton(
          icon: Icon(Icons.add),
          color: Styles.lightIcon,
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditNotePage()));},
        ),
      ],
    );
  }
}