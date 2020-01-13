import 'package:bible_test2/UI/Models/Profile/VitalityGroup/GroupModel.dart';
import 'package:bible_test2/UI/Models/Profile/VitalityGroup/GroupTile.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> with AutomaticKeepAliveClientMixin<GroupList>{

  @override 
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  final items = List<String>.generate(3, (i) =>
        "활력그룹 ${i+1}번 모임"
    );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(child: Container(height: 50,),),
        //TODO: Add a 중요한 / Important vitality group list
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("나의 활력그룹", style: TextStyle(color: Colors.black, fontSize: 24),),
          ),
        ),
        SliverToBoxAdapter(child: Container(height: 32,),),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GroupTile(groupData: new GroupModel(items[index], "재헌, 경훈, 승한, 성진"));
            }     
            ,childCount: items.length
          ),
                   
        ),
        SliverToBoxAdapter(child: Container(height: 50,),),

      ],
    );
  }

}