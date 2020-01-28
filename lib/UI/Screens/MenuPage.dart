import 'package:bible_test2/Blocs/Login/Authentication.dart';
import 'package:bible_test2/UI/Models/Menu/MenuAppBar.dart';
import 'package:bible_test2/UI/Models/Menu/MenuToProfile.dart';
import 'package:bible_test2/UI/Models/Menu/SettingsBar.dart';
import 'package:bible_test2/UI/Models/Menu/SettingsTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  BaseAuth auth;
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  FirebaseAuth mAuth;
  FirebaseUser user;
  var uid;

  @override
  initState() {
    mAuth = FirebaseAuth.instance;
    inputData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          MenuAppBar(),
          MenuToProfile(user: user,),
          SettingsTile(),
          SettingsBar()
        ],
      ),
      //bottomNavigationBar: BibleBottomNavigationBar(context: context,),
    );
  }

  void inputData() async {
    user = await mAuth.currentUser();
  }
}