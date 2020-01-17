import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bible_test2/UI/Screens/LoginPage/ProfileEditPage.dart';

class MenuToProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FlatButton(
        onPressed: (){cupertinoNavigate(context, ProfileEditPage());},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.profile_circled),
              color: Styles.lightIcon,
              iconSize: 60,
              onPressed: (){cupertinoNavigate(context, ProfileEditPage());},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "송재헌 형제",
                    style: Styles.titleText,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "steve2972@gmail.com",
                    style: TextStyle(color: Colors.grey),
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