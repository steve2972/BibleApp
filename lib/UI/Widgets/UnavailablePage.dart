import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:flutter/material.dart';

class UnavailablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "미정"),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text("아직 제공하지 않는 서비스입니다. 업데이트 되는 대로 공지해 드리겠습니다."),
        ),
      ),
    );
  }
}