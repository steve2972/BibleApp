import 'package:flutter/material.dart';

class NotesTopAppBar extends StatelessWidget {
  const NotesTopAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[50],
      floating: true,
      centerTitle: true,
      title: Text("북마크", style: TextStyle(color: Colors.black),),
    );
  }
}
