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
          _buildTile(context, Icons.video_library, "동영상", Colors.grey[900], null),
          _buildTile(context, Icons.library_music, "오디오", Colors.grey[900], null),
          _buildTile(context, Icons.folder, "자료", Colors.grey[900], null),

          

        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String label, Color color, Widget route) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
      },
      child: 
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(
          height: 100,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(26),
                alignment: Alignment.centerRight,
                child: Opacity(
                  opacity: 0.3,
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon, color: Colors.white),
                    const SizedBox(height: 16,),
                    Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}