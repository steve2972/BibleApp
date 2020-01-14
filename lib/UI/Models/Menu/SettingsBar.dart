import 'package:bible_test2/UI/Screens/MenuPage/HelpAndSupport/AboutAppPage.dart';
import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/SettingsPage.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.settings),
            title: Text("기본설정/보안", style: Styles.titleText,),
            children: <Widget>[
              createSettingsBar(
                Icon(CupertinoIcons.profile_circled, color: Colors.grey[500],), "환경설정", SettingsPage(), context),
              createSettingsBar(Icon(Icons.timer, color: Colors.orange,), "사용 시간", null, context),
              createSettingsBar(Icon(Icons.exit_to_app, color: Colors.blue,), "로그아웃", null, context),

            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.help),
            title: Text("고객센터/도움말", style: Styles.titleText,),
            children: <Widget>[
              createSettingsBar(Icon(Icons.list, color: Colors.red,), "FAQ", null, context),
              createSettingsBar(Icon(Icons.help_outline, color: Colors.green,), "앱에 대하여", AboutAppPage(), context),
              createSettingsBar(Icon(Icons.warning, color: Colors.yellow[800],), "문제 신고", null, context),

            ],
          ),
        ],
      )
    );
  }

  Widget createSettingsBar(Icon icon, 
            String string, Widget route, BuildContext context) {
    return CupertinoButton(
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: icon,
              ),
              Text(
                "$string",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                )
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
      },
    );
  }
}