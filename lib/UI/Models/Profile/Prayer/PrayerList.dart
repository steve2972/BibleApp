import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerModel.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

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
        trailing: IconButton(icon: Icon(OMIcons.starBorder), color: Colors.yellow[700], onPressed: (){},),
      )
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
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text("Are you sure you wish to delete this item?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("DELETE")
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL"),
                            ),
                          ],
                        );
                      }
                      else if (direction == DismissDirection.startToEnd) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text("Are you sure you wish to archive this item?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("ARCHIVE")
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL"),
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
                key: Key(item.title.toString()),
                child: _prayerTiles[index],
                background: Container(color: Colors.green, child: Icon(Icons.archive, color: Colors.white,),),
                secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete, color: Colors.white,),),

              );
            },
            childCount: _prayerTiles.length
          )
        )
      ]
    );
  }

  
}