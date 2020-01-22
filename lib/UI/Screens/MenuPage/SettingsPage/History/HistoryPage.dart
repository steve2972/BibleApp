import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "읽기 기록"),
    );
  }
}