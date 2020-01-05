import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class MorningRev extends StatelessWidget{
  const MorningRev({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('오늘의 양식', style: Styles.titleText,),
            Text('Lorem Ipsum dotum lorem ipsum lorem ipsum doetum lorem ipsum dotuem fdjakfds fdasjfdkafd dfjakfd dfjdakdsakdj asfdsjasdjfds jdfafkfjadsfdsjk', style: Styles.readText,)
          ],
        ),
      ),
    );
  }
}