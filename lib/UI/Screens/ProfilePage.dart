import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerList.dart';
import 'package:bible_test2/UI/Models/Profile/VitalityGroup/GroupList.dart';
import 'package:bible_test2/UI/Models/Profile/ProfileAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync:  this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          ProfileAppBar("송재헌", true, tabController),
          SliverFillRemaining(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              controller: tabController,
              children: <Widget>[
                PrayerList(),
                GroupList(),
                Text("tab3"),
              ],
            ),
          )

        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData(size: 22),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        onOpen: () => print("Dial opened"),
        onClose: () => print("Dial closed"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.group_add),
            backgroundColor: Colors.blue,
            label: "활력그룹 추가",
            labelStyle: TextStyle(fontSize: 16),
            onTap: (){}
          ),
          SpeedDialChild(
            child: Icon(Icons.note_add),
            backgroundColor: Colors.green,
            label: "기도제목 추가",
            labelStyle: TextStyle(fontSize: 16),
            onTap: (){}
          ),
        ],

      ),
      bottomNavigationBar: BibleBottomNavigationBar(context: context,),
    );
  }
}