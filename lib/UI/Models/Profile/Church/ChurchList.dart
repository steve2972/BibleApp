import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class ChurchList extends StatefulWidget {
  @override
  ChurchListState createState() => ChurchListState();
}

class ChurchListState extends State<ChurchList> with AutomaticKeepAliveClientMixin<ChurchList> {


  @override 
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(child: Container(height: 50,),),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("주일집회 통계", style: TextStyle(color: Colors.black, fontSize: 24),),
          ),
        ),

        SliverToBoxAdapter(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildStatTile(context, "1월 5일"),
                _buildStatTile(context, "1월 12일"),
              ]

          )
        ),


        SliverToBoxAdapter(child: Container(height: 50,),),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("동대문 대지역 소식", style: TextStyle(color: Colors.black, fontSize: 24),),
          ),
        ),
        SliverToBoxAdapter(child: Container(height: 32,),),

        SliverToBoxAdapter(
          child: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("1. 주요 공지", style: TextStyle(color: Colors.blue[700], fontSize: 20),),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left:32, top:16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(title: Text("주요공지는 여기 란에 들어갑니다.", style: Styles.readTextBlack,)),
                ListTile(title: Text("주요공지는 여기 란에 들어갑니다.", style: Styles.readTextBlack,)),
                ListTile(title: Text("주요공지는 여기 란에 들어갑니다.", style: Styles.readTextBlack,))
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("2. 주요 일정", style: TextStyle(color: Colors.blue[700], fontSize: 20),),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left:32, top:16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(title: Text("주요공지는 여기 란에 들어갑니다.", style: Styles.readTextBlack,)),
                ListTile(title: Text("주요공지는 여기 란에 들어갑니다.", style: Styles.readTextBlack,)),
                ListTile(title: Text("주요공지는 여기 란에 들어갑니다.", style: Styles.readTextBlack,))
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("3. 성도 소식", style: TextStyle(color: Colors.blue[700], fontSize: 20),),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left:32, top:16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(title: Text("성도소식은 여기 란에 들어갑니다.", style: Styles.readTextBlack,)),
                ListTile(title: Text("성도소식은 여기 란에 들어갑니다.", style: Styles.readTextBlack,)),
                ListTile(title: Text("성도소식은 여기 란에 들어갑니다.", style: Styles.readTextBlack,))
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(child: Container(height: 50,),),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("서울교회 소식", style: TextStyle(color: Colors.black, fontSize: 24),),
          ),
        ),
        SliverToBoxAdapter(child: Container(height: 32,),),
      ],
    );
  }

  Widget _buildStatTile(BuildContext context, String date) {
    return ListTile(
      title: Center(child: Text("[$date] 주일집회 참석", style: TextStyle(fontSize: 18),)),
      leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){},
          ),
      trailing: IconButton(
            icon: Icon(Icons.done),
            onPressed: (){},
          ),
      
    );
  }
}