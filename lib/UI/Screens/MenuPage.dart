import 'package:bible_test2/UI/Models/Menu/MenuAppBar.dart';
import 'package:bible_test2/UI/Models/Menu/MenuToProfile.dart';
import 'package:bible_test2/UI/Models/Menu/SettingsBar.dart';
import 'package:bible_test2/UI/Models/Menu/SettingsTile.dart';
import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final int number;

  MenuPage({this.number}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          MenuAppBar(),
          MenuToProfile(),
          SettingsTile(),
          SettingsBar()
        ],
      ),
      bottomNavigationBar: BibleBottomNavigationBar(context: context,),
    );
  }

  
}