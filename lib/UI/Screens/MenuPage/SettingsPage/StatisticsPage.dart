import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.grey[100],
            title: Text("통계 및 기록", style: TextStyle(color: Colors.black),),
            leading: IconButton(icon: Icon(Icons.arrow_back_ios), color: Styles.lightIcon, onPressed: (){Navigator.pop(context);},),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "요약",
                    style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("즐겨찾기", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),),
                      Spacer(),
                      CupertinoButton(
                        onPressed: (){},
                        child: Text(
                          "편집",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
          _buildStatTile(context, "오늘의 분량", "1시간 28분", "성경읽기"),
          _buildStatTile(context, "오늘의 누림", "47분", "찬송 부르기"),
          _buildStatTile(context, "이번주 활력그룹", "5시간 15분", "그룹 누리기"),
          SliverToBoxAdapter(
            child: 
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white,
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: <Widget>[
                    Text("모든 누림 데이터 보기", style: TextStyle(color: Colors.blue),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Styles.lightIcon,size: 14,)
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
              child: Text("하이라이트", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildStatTile(BuildContext context, String title, String time, String subtitle) {
    return SliverToBoxAdapter(
      child: 
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: RaisedButton(
          onPressed: (){},
          color: Colors.white,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.book, color: Colors.orange[800],),
                      Text("  $title", style: TextStyle(fontSize: 16, color: Colors.orange[800]),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Styles.lightIcon, size: 14,)
                ],
              ),
              Container(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(time, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  Text("  $subtitle", style: TextStyle(fontSize: 16, color: Colors.grey),)
                ],
              ),
              Container(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}