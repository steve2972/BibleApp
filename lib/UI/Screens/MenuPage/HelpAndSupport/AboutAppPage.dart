import 'package:bible_test2/UI/Screens/MenuPage/HelpAndSupport/LicenseMarkdown/LocationLicense.dart';
import 'package:bible_test2/UI/Screens/MenuPage/HelpAndSupport/LicenseMarkdown/OpenLicense.dart';
import 'package:bible_test2/UI/Widgets/filler.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Styles.LightAppBarColor,
        elevation: 0.5,
        title: Text("고객센터/도움말", style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), color: Styles.lightIcon, onPressed: (){Navigator.pop(context);},),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildTile(context, "도움말", null),
          _buildTile(context, "문의하기", null),
          Filler(),
          _buildSoftTile("약관 및 정책"),
          _buildTile(context, "이용약관", null),
          _buildTile(context, "위치기반서비스 이용약관", LocationLicense()),
          _buildTile(context, "개인정보처리방침", null),
          _buildTile(context, "운영정책", null),
          _buildTile(context, "오픈소스 라이선스", OpenLicense()),
          Filler(),
          _buildSoftTile("앱 소개"),
          _buildAbout("상호", "(주)한국복음서원"),
          _buildAbout("개발자", "송재헌"),
          _buildAbout("후원자", "복음서원"),
          _buildAbout("주소", "[복음서원 주소란]"),
          _buildAbout("연락처", "복음서원: (    )\n개발자: stevensong@kakao.com"),
          _buildAbout("홈페이지", "www.btmk.org"),


        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, Widget route) {
    return 
    Container(

      child: FlatButton(
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
        },
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 16, right: 16),
          title: Text(title, style: TextStyle(fontSize: 16),), 
          trailing: Icon(Icons.arrow_forward_ios, color: Styles.lightIcon,),
        ),
      ),
    );
  }

  Widget _buildSoftTile(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
      ),
      child: ListTile(title: Text(title, style: TextStyle(color: Colors.grey[500], fontSize: 14),)),
    );
  }

  Widget _buildAbout(String title, String subTitle) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 14),),
      subtitle: Text(subTitle, style: TextStyle(color: Colors.black, fontSize: 16),),
    );
  }
}