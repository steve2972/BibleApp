import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:bible_test2/UI/Models/Reader/ReaderChapterView.dart';
import 'package:flutter/material.dart';

class ReaderPage extends StatelessWidget {
  //int number;

  //ReaderPage({this.number}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChapterView(),
      bottomNavigationBar: BibleBottomNavigationBar(context: context,),
    );
  }
}