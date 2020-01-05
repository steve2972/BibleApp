import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class MorningVerses extends StatelessWidget{
  const MorningVerses({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FlatButton(
        onPressed: (){},
              child: Container(
          margin: EdgeInsets.only(right: 16, top: 8, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('디도서 3장 15절'),
              Text('All who are with me greet you. Greet those who love us in faith. Grace be with you all.', style: Styles.readText,)
            ],
          ),
        ),
      ),
    );
  }
}