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

  final items = List<String>.generate(20, (i) =>
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
              final item = items[index];
            
              return Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    final snackBar = SnackBar(content: Text("Deleted"), backgroundColor: Colors.red, duration: Duration(seconds: 1),);
                    Scaffold.of(context).showSnackBar(snackBar);
                    setState(() {
                      items.removeAt(index);
                    });
                  }
                  else if (direction == DismissDirection.startToEnd) {
                    final snackBar = SnackBar(content: Text("Archived"), backgroundColor: Colors.green,duration: Duration(seconds: 1),);
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                  
                },
                key: Key(item),
                child: GroupTile(groupData: 
                  new GroupModel("$item", "재헌 승한 경훈 성진"),),
                background: Container(color: Colors.green, child: Icon(Icons.archive, color: Colors.white,),),
                secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete, color: Colors.white,),),

              );
            }, childCount: items.length
          ),
        ),
      ],
    );
  }
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if(newIndex > oldIndex) {
        newIndex -= 1;
      }
      //final PrayerModel item = items.removeAt(oldIndex);
      //items.insert(newIndex, item);
    });
  }

}