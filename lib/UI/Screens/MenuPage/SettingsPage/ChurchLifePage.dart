import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:flutter/material.dart';

class ChurchLifePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "지역 생활"),
    );
  }
}