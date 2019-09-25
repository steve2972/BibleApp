import 'package:flutter/material.dart';
import 'package:bible_app/utils/Strings.dart';

class MainHome extends StatefulWidget {
  MainHome({Key key, this.title}): super(key: key);
  final String title;

  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome> {
  bool _isVisible = true;
  String _title = "홈";
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final topBar = new AppBar(
    backgroundColor: Colors.grey[50],
    centerTitle: true,
    elevation: 0.0,
    leading: new IconButton(
      icon: new Icon(Icons.menu),
      color: Colors.black,
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    ),
    title: Text("홈"),
  );
  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: topBar,
      body: Container(color: Colors.grey[50],),
      drawer: startDrawer(),
    );
  }

  Widget startDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: DrawerHeader(
              child: Column(
              children: <Widget>[
                Text(
                  "성경앱 Example",
                  style: TextStyle(
                    fontFamily: Strings.fontRobotoRegular,
                    fontSize: 18.0,
                    color: Colors.white
                  ),
                ),
                Text(
                  "biblesforkorea@gmail.com",
                  style: TextStyle(
                    fontFamily: Strings.fontRobotoRegular,
                    fontSize: 14.0,
                    color: Colors.white
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            decoration: BoxDecoration(color: Colors.blue),
              ),
          ),
          createDrawerListTiles(Icons.folder_open, "가져오기"),
          createDrawerListTiles(Icons.photo, "앨범"),
          createDrawerListTiles(Icons.slideshow, "동영상"),
          createDrawerListTiles(Icons.build, "환경설정"),
          createDrawerListTiles(Icons.person, "내 프로필"),
          Divider(),
          createDrawerListTiles(Icons.person_add, "친구 추가"),
          createDrawerListTiles(Icons.share, "공유"),
          Divider(),
          createDrawerListTiles(Icons.book, "콘텐츠 구매"),
          createDrawerListTiles(Icons.web, "복음서원 홈페이지")

        ],
      ),
    );
  }

  Widget createDrawerListTiles(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: Strings.fontRobotoBold,
          fontSize: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _title = title;
          Navigator.pop(context);
        });
      },
    );
  }

  Widget circularAvatars() {
    return CircleAvatar(
      backgroundColor: Colors.orangeAccent,
      child: FlutterLogo(),
    );
  }
}