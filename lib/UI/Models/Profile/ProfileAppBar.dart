import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  final String name;
  final bool isMale;
  final TabController controller;

  ProfileAppBar(this.name, this.isMale, this.controller);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Styles.LightAppBarColor,
      elevation: 1.5,
      pinned: true,
      title: Text("$name ${isMale ? "형제" : "자매"}", style: TextStyle(color: Colors.black),),
      centerTitle: true,
      expandedHeight: 185,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
          color: Styles.lightIcon,
        ),
      ],
      bottom: TabBar(
        tabs: <Widget>[
          new Tab(icon: Icon(Icons.list, color: Styles.lightIcon,),child: Text('기도제목', style: TextStyle(color: Colors.grey[800]),),),
          new Tab(icon: Icon(Icons.group, color: Styles.lightIcon,),child: Text('활력그룹', style: TextStyle(color: Colors.grey[800]),),),
          new Tab(icon: Icon(Icons.group_work, color: Styles.lightIcon,), child: Text('교회생활', style: TextStyle(color: Colors.grey[800]),),)
        ],
        controller: controller,
      ),
    );
  }
}