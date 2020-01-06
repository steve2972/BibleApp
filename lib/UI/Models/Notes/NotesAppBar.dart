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
      title: Text("Notes", style: Styles.mainText),
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.add),
          color: Styles.lightIcon,
          onPressed: () {Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                EditNotePage(triggerRefetch: refetchNotesFromDB)));},
        ),
      ],
    );
  }
}