import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    //this.settingTileColor,
    //this.settingTileIcon,
    //this.settingTileString,
    //this.settingTileColor2,
    //this.settingTileIcon2,
    //this.settingTileString2,
    Key key
  }) : super(key: key);

  //final Icon settingTileIcon;
  //final Color settingTileColor;
  //final String settingTileString;
  //final Icon settingTileIcon2;
  //final Color settingTileColor2;
  //final String settingTileString2;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              buildSettingsTile(Icon(Icons.people, color: Colors.green,), "지체들", context),
              buildSettingsTile(Icon(Icons.home, color: Colors.blue,), "지역생활", context),
            ],
            
          ),
          Row(
            children: <Widget>[
              buildSettingsTile(Icon(Icons.payment, color: Colors.black,), "구매목록", context),
              buildSettingsTile(Icon(Icons.local_library, color: Colors.orange,), "사역의 말씀", context),
            ],
          ),
          Row(
            children: <Widget>[
              buildSettingsTile(Icon(Icons.event, color: Colors.pink,), "이벤트", context),
              buildSettingsTile(Icon(Icons.bookmark, color: Colors.amber,), "저장됨", context),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSettingsTile(Icon icon,
                        String string, BuildContext context) {
    return CupertinoButton(
      child: Container(
        height: 60,
        width: 160,
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
                  fontFamily: 'Nanum Gothic'
                  //fontWeight: FontWeight.w600
                )
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text("$string is clicked"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context, "OK");
                },
              )
            ],
          )
        );
      },
    );
  }
}