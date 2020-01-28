import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:bible_test2/UI/Widgets/UnavailablePage.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Styles.LightAppBarColor,
        elevation: 0,
        title: Text("Other", style: TextStyle(color: Colors.blue),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildTile(context, Icons.video_library, "동영상", UnavailablePage()),
          _buildTile(context, Icons.library_music, "오디오", UnavailablePage()),
          _buildTile(context, Icons.folder, "자료", UnavailablePage()),

          

        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String label, Widget route) {
    return FlatButton(
      onPressed: () {cupertinoNavigate(context, route);},
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        trailing: Icon(Icons.arrow_forward_ios, size: 14,),
      ),
    );
  }

}