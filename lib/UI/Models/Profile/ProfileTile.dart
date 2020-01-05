import 'package:bible_test2/UI/Widgets/space.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  final textColor;
  ProfileTile({this.title, this.subtitle, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: profile()
    );
  }

  Widget profileHeader() => Container(
    height: 200,
    width:  double.infinity,
    color: Colors.grey[50],
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: new Stack(
        children: <Widget>[
          new Positioned(
              child: new Container(
                height: 130.0,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.orange[800],
                        Colors.orange[700],
                        Colors.orange[600],
                        Colors.orange[400],
                      ]
                      ),
                    ),
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
                      child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(160),
              border: Border.all(width: 5, color: Colors.grey[50]),
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey[200],
              ),  
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.camera_alt),
              color: Colors.grey,
            ),
          )
        ],
      ),
    ),
  );

  Widget profileDescription() => Padding(
    padding: EdgeInsets.all(16),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        child: Text("Steven Song", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
      ),
      Space(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            minWidth: 200,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(OMIcons.cameraAlt, color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Add Story", style: TextStyle(color: Colors.white),),
                    )
                  ],
              ),
            ),
          ),
          ButtonTheme(
            buttonColor: Colors.green,
            minWidth: 100,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(OMIcons.share, color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Share", style: TextStyle(color: Colors.white),),
                    )
                  ],
              ),
            ),
          ),
        ],
      ),
      Divider(),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.school, color: Styles.lightIcon,),
            Container(width: 8,),
            Text("Studies at Seoul National University 서울대"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.school, color: Styles.lightIcon,),
            Container(width: 8,),
            Text("Studied at Hanyang University"),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.school, color: Styles.lightIcon,),
            Container(width: 8,),
            Text("Went to 세종국제고"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.home, color: Styles.lightIcon,),
            Container(width: 8,),
            Text("Lives in Seoul, Korea", style: Styles.readTextBlack,),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.location_on, color: Styles.lightIcon,),
            Container(width: 8,),
            Text("동대문지역 생활 중", style: Styles.readTextBlack,),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.more_horiz, color: Styles.lightIcon,),
            Container(width: 8,),
            Text("개인정보 더 보기",),
          ],
        ),
      ),
      Divider(),
      Space(),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            buttonColor: Colors.grey[300],
            //minWidth: 160,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(OMIcons.add, color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("기도명단 추가", style: TextStyle(color: Colors.black),),
                    )
                  ],
              ),
            ),
          ),
          ButtonTheme(
            buttonColor: Colors.grey[300],
            //minWidth: 160,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(OMIcons.groupAdd, color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("활력그룹 추가", style: TextStyle(color: Colors.black),),
                    )
                  ],
              ),
            ),
          ),
        ],
      ),
    ],
  ));

  Widget profile() => Column(
    children: <Widget>[
      profileHeader(),
      profileDescription(),
    ],
  );
}