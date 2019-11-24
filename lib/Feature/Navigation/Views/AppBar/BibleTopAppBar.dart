import 'package:bible_bloc/Feature/Reader/reader_feature.dart';
import 'package:bible_bloc/Feature/Search/search_feature.dart';
import 'package:bible_bloc/Feature/Settings/settings_feature.dart';
import 'package:flutter/material.dart';

class BibleReaderAppBar extends StatelessWidget {
  final String title;
  const BibleReaderAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[50],
      pinned: true,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.collections_bookmark),
        color: Colors.black,
        onPressed: () => showSearch(
              context: context,
              delegate: BibleSearchDelegate(),
            ),
      ),
      title: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(child: BooksList());
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.black),),
            Icon(Icons.arrow_right, color: Colors.black,),
          ],
        ),
      ),
      /* actions: <Widget>[
        SettingsPopupMenu(),
      ],*/

     
      actions: <Widget>[
        /*
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => showSearch(
                context: context,
                delegate: BibleSearchDelegate(),
              ),
        ), */

        SettingsPopupMenu()
      ],
    );
  }
}
