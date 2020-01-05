import 'package:bible_test2/UI/Models/Home/HomeAppBar.dart';
import 'package:bible_test2/UI/Models/Home/HomeShare.dart';
import 'package:bible_test2/UI/Models/Home/MorningRev.dart';
import 'package:bible_test2/UI/Models/Home/MorningVerses.dart';
import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          HomeAppBar(),
          HomeShare(),
          filler(),
          buildHeaderWidget(context),
          SliverToBoxAdapter(child: Divider()),
          MorningVerses(), MorningVerses(), MorningVerses(),
          MorningRev(),
          filler(),
          MorningRev(),MorningRev(),MorningRev(),MorningRev(),
          MorningRev(),MorningRev(),MorningRev(),MorningRev(),
          MorningRev(),MorningRev(),MorningRev(),MorningRev(),
          MorningRev(),MorningRev(),MorningRev(),MorningRev(),
          MorningRev(),MorningRev(),MorningRev(),MorningRev(),
          MorningRev(),MorningRev(),MorningRev(),MorningRev(),


        ],

        
      ),
      bottomNavigationBar: BibleBottomNavigationBar(context: context),
    );
  }
  
  Widget buildHeaderWidget(BuildContext context) {
    return SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(margin: EdgeInsets.only(left: 16),),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                width: 180,
                child: Text(
                  '오늘의 양식과 말씀',
                  style: TextStyle(
                  fontFamily: 'Nanum',
                  color: Colors.black,
                  fontSize: 20),
                overflow: TextOverflow.clip,
                softWrap: false,
                ),
              ),
              
              IconButton(
                icon: new Icon(OMIcons.notificationsOff), 
                onPressed: () {},
                color: Theme.of(context).brightness == Brightness.light ? Styles.lightIcon : Styles.darkIcon
                )
        ],
      ),
    );
  }

  Widget filler() {
    return SliverToBoxAdapter(
      child: Container(
        height: 8,
        color: Colors.grey[300],
      ),
    );
  }
}
