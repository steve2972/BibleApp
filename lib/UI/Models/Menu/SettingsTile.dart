import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/CalendarPage.dart';
import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/StatisticsPage.dart';
import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildSettingsTile(Icon(Icons.people, color: Colors.green,), "지체들", context, null),
              buildSettingsTile(Icon(Icons.home, color: Colors.blue,), "지역생활", context, null),
            ],
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildSettingsTile(Icon(Icons.payment, color: Colors.black,), "구매목록", context, null),
              buildSettingsTile(Icon(Icons.scatter_plot, color: Colors.orange,), "나의통계", context, StatisticsPage()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildSettingsTile(Icon(Icons.event, color: Colors.red,), "교회일정", context, CalendarPage()),
              buildSettingsTile(Icon(Icons.bookmark, color: Colors.amber,), "저장됨", context, null),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSettingsTile(Icon icon,
                        String string, BuildContext context, Widget route) {
    return CupertinoButton(
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.grey[300],
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
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                )
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        cupertinoNavigate(context, route);
      }
    );
  }
}