import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:bible_test2/UI/Models/Reader/Bible/KoreanReaderPage.dart';
import 'package:bible_test2/UI/Screens/LoginPage/ProfileEditPage.dart';
import 'package:bible_test2/UI/Screens/MenuPage/HelpAndSupport/AboutAppPage.dart';
import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/PurchasePage.dart';
import 'package:bible_test2/UI/Widgets/filler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bible_test2/UI/Models/Menu/SettingsPage/SettingsPageAppBar.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SettingsPageAppBar(),
          accountSettings(context),
          SliverToBoxAdapter(child: Filler(),),
          securitySettings(context),
          SliverToBoxAdapter(child: Filler(),),
          serviceInformation(context)

        ],
      ),
      //bottomNavigationBar: BibleBottomNavigationBar(context: context,),
    );
  }

  Widget accountSettings(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("계정 및 환경 설정", style: TextStyle(fontSize: 18),),
                Text("본인에 대한 정보, 구매방법, 연락처 설정 및 일반적인 설정을 관리합니다.", style: TextStyle(color: Colors.grey[500]),)
              ],
              
            ),
            _buildButton(context, CupertinoIcons.profile_circled, "개인정보 설정", "이름, 이메일 주소 및 연락처를 수정하세요", ProfileEditPage()),
            _buildButton(context, Icons.payment, "구매방법 및 카드 관리", "카드관리 및 구매기록을 확인하세요", PurchasePage()),
            _buildButton(context, Icons.cast_connected, "연결된 계정", "SNS으로 연동된 계정을 한눈으로 확인하세요.", KoreanReaderPage(70)),
          ],
        ),
      ),
    );
  }

  Widget securitySettings(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle("보안 설정", "비밀번호 변경과 추가적 설정으로 계정의 안정성을 높이세요."),
            _buildButton(context, Icons.security, "보안 및 로그인", "비밀번호 변경과 보안 설정", null),
            _buildButton(context, Icons.lock, "익명성", "회원의 공개설정을 확인하세요", null),
          ],
        ),
      ),
    );
  }

  Widget serviceInformation(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle("서비스 정보", "서비스 이용약관 및 사용 계약을 참고하세요."),
            _buildButton(context, Icons.notification_important, "공지사항", "개발자가 직접 공지하는 알림", null),
            _buildButton(context, Icons.help_outline, "고객센터", "문제 문의와 앱에 관련한 정보", AboutAppPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 18),),
        Text(subtitle, style: TextStyle(color: Colors.grey[500]),)
      ],
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String title, String subTitle, Widget route) {
    return FlatButton(
      onPressed: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => route));},
      child: 
      ListTile(
          leading: Icon(icon, size: 32,color: Colors.grey[800],),
          title: Text(title, style: TextStyle(fontSize: 16),),
          subtitle: Text(subTitle, style: TextStyle(color: Colors.grey[500]),)
        ),
    );
  }
}