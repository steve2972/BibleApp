import 'package:bible_bloc/Feature/InheritedBlocs.dart';
import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[50],
      floating: true,
      centerTitle: true,
      title: Text("읽기 기록", style: TextStyle(color: Colors.black),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.black,
          onPressed: () => InheritedBlocs.of(context).bibleBloc.clearHistory(),
        )
      ],
    );
  }
}
