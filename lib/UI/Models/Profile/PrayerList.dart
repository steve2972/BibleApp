import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class PrayerList extends StatelessWidget{
  const PrayerList({
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
            child: Text("기도명단", style: Styles.mainText,textAlign: TextAlign.left,)
            ),
          
          Divider(color: Colors.black,),
          
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("- 복음친구 강화 \n- 중보기도 강화\n- 이것저것\n- 이것저것\n- 이것저것\n- 이것저것\n- 이것저것\n- 이것저것\n",
              style: TextStyle(fontSize: 18),),
            ),
          )
        ],
      ),
    ),
  ));
  List<Widget> buildPrayersList() {
    List<Widget> prayerList = [];
    return prayerList;
  }
}