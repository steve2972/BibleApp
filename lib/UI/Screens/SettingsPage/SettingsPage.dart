import 'package:flutter/material.dart';
import 'package:bible_test2/UI/Models/Menu/SettingsPage/SettingsPageAppBar.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SettingsPageAppBar(),
        ],
      ),
    );
  }
}