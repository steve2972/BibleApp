import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuToProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FlatButton(
        onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.profile_circled),
              color: Styles.lightIcon,
              iconSize: 60,
              onPressed: (){},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Steven Song",
                    style: Styles.titleText,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "View Profile"
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}