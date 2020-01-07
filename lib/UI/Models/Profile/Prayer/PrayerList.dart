import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerModel.dart';
import 'package:flutter/material.dart';

class PrayerList extends StatefulWidget {
  @override
  PrayerListState createState() => PrayerListState();
}

class PrayerListState extends State<PrayerList> with AutomaticKeepAliveClientMixin<PrayerList>{
  final items = List<String>.generate(20, (i) =>
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
      (item) => ListTile(
        key: Key(item.content),
        title: Text(item.content),
        leading: Icon(Icons.drag_handle),
        trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: (){},),
      )
    ).toList();
    return ReorderableListView(
      header: Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 50, 0, 32),
          child: Text("기도제목", style: TextStyle(color: Colors.black, fontSize: 24),),
        ),
      ),
      onReorder: _onReorder,
      children: _prayerTiles,
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if(newIndex > oldIndex) {
        newIndex -= 1;
      }
      final PrayerModel item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }
}