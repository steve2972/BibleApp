import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/History/HistoryPage.dart';
import 'package:bible_test2/UI/Screens/NotesPage/NotesPage.dart';
import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:bible_test2/UI/Widgets/CommonTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "저장됨"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          buildCommonTile(context, Icons.bookmark_border, "저장된 구절", null),
          buildCommonTile(context, Icons.note, "신언노트", NotesPage()),
          buildCommonTile(context, Icons.history, "읽기 기록", HistoryPage()),
        ],
      ),
    );
  }

}