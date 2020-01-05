import 'package:bible_test2/UI/Widgets/space.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget{
  const GroupList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(child: Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text("활력그룹 목록", style: Styles.mainText,textAlign: TextAlign.left,)
            ),

          Space(),
          groupTile(Colors.red[100]),
          groupTile(Colors.green[100]),
          groupTile(Colors.pink[100]),

        ],
      ),
    ),
  ));

  Widget groupTile(Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ButtonTheme(
        buttonColor: color,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
          onPressed: () {},
          child: Column(
            children: <Widget>[
              Text("고대 활력그룹", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
              Text("송재헌, 조민우, 원경훈, 오성진", style: TextStyle(fontSize: 16),),
              Container(
                alignment: Alignment.centerRight,
                child: Text("개설날짜: 2019년 10월8일",style: TextStyle(fontWeight: FontWeight.w400)),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text("마지막 만난 날짜: 2019년 12월8일",style: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ],
          )
        ),
      ),
    );
  }
  List<Widget> buildGroupsList() {
    List<Widget> prayerList = [];
    return prayerList;
  }
}