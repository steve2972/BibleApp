import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:bible_test2/UI/Widgets/commonTitle.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "동반자들"),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          buildCommonTitleSliver("나의 동반자들"),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          buildCommonTitleSliver("알만한 지체들"),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),
          _buildFriendTile(context, "조민우", "동대문", 1),

        ],
      )
    );
  }

  Widget _buildFriendTile(BuildContext context, String name, String district, int gender) {
    return 
    SliverToBoxAdapter(
          child: ListTile(
        onTap: (){},
        title: Text("$name ${gender == 1 ? "형제 ": "자매"}"),
        subtitle: Text("$district 지역 생활"),
        leading: Icon(Icons.person_pin_circle),
      ),
    );
  }

  //TODO: make a _buildFriendTile list builder
}