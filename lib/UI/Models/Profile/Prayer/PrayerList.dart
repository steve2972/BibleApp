import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerModel.dart';
import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PrayerList extends StatefulWidget {
  @override
  PrayerListState createState() => PrayerListState();
}

class PrayerListState extends State<PrayerList> with AutomaticKeepAliveClientMixin<PrayerList>{
  final items = List<String>.generate(5, (i) =>
    '기도제목 ${i+1}번 기도'
  ).map((item) => PrayerModel(item)).toList();
  
  
  
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context){
    final _prayerTiles = items.map(
      (item) => PrayerTile(model: new PrayerModel(item.content),)
    ).toList();
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(child: Container(height: 50,),),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("나의 기도제목", style: TextStyle(color: Colors.black, fontSize: 24),),
          ),
        ),
        SliverToBoxAdapter(child: Container(height: 32,),),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = _prayerTiles[index];

              return Dismissible(
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      if (direction == DismissDirection.endToStart) {
                        return CupertinoAlertDialog(
                          title: const Text("확인"),
                          content: const Text("위 기도제목을 정말 삭제하시겠습니까?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("삭제", style: TextStyle(color: Colors.red),)
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("아니오", style: TextStyle(color: Colors.blue),),
                            ),
                          ],
                        );
                      }
                      else if (direction == DismissDirection.startToEnd) {
                        return CupertinoAlertDialog(
                          title: const Text("확인"),
                          content: const Text("위 기도제목을 정말 보관하시겠습니까?"),
                          actions: <Widget>[
                            CupertinoButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("보관함", style: TextStyle(color: Colors.green),)
                            ),
                            CupertinoButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("아니오", style: TextStyle(color: Colors.blue),),
                            ),
                          ],
                        );
                      }
                      
                    },
                  );
                },
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
                    setState(() {
                      items.removeAt(index);
                    });
                  }
                  
                },
                key: Key(_prayerTiles[index].model.content),
                child: _prayerTiles[index],
                background: Container(color: Colors.green, child: Icon(Icons.archive, color: Colors.white,),alignment: Alignment.centerLeft, padding: EdgeInsets.only(left: 16),),
                secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete, color: Colors.white,),alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 16)),

              );
            },
            childCount: _prayerTiles.length
          )
        ),

        SliverToBoxAdapter(child: Container(height: 50,),),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("지역 기도제목", style: TextStyle(color: Colors.black, fontSize: 24),),
          ),
        ),
        SliverToBoxAdapter(child: Container(height: 32,),),

        //TODO: Change Column to a dynamic list from Firebase
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              PrayerTile(model: new PrayerModel("북핵 위험이 제거되고 한반도 정세가 안정되며 북한에 복음의 문이 열리도록"),),
              PrayerTile(model: new PrayerModel("하나님께서 정하신 길의 지속적인 실행"),),
              PrayerTile(model: new PrayerModel("모든 성도들이 2-3명의 동반자들과 연결되도록"),),
              PrayerTile(model: new PrayerModel("동반자들과 함께 섞이고 아침 부흥하고 기도하며 복음전파와 목양의 생활을 살도록"),),
              PrayerTile(model: new PrayerModel("뒤로 물러난 성도들, 새로운 분들이 활력그룹 안에서 회복되고 얻어지도록"),),
              PrayerTile(model: new PrayerModel("다음세대와 중장년 성도들이 서로 섞이고 열매 맺는 동반자 관계로 발전되도록"),),
            ],
          ),
        )

      ]
    );
  }

  
}