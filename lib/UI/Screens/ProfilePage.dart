import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:bible_test2/UI/Models/Profile/GroupList.dart';
import 'package:bible_test2/UI/Models/Profile/PrayerList.dart';
import 'package:bible_test2/UI/Models/Profile/ProfileAppBar.dart';
import 'package:bible_test2/UI/Models/Profile/ProfileTile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          ProfileAppBar(),
          ProfileTile(),
          SliverToBoxAdapter(child: Container(height: 8, color: Colors.grey[300],),),
          PrayerList(),
          SliverToBoxAdapter(child: Container(height: 8, color: Colors.grey[300],),),
          GroupList(),
        ],
      ),
      bottomNavigationBar: BibleBottomNavigationBar(context: context,),
    );
  }
}