import 'package:bible_test2/Blocs/BibleProvider/Verse.dart';
import 'package:flutter/material.dart';

class KorVerseWidget extends StatelessWidget {
  final Verse verse;

  const KorVerseWidget({Key key, @required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: GestureDetector(
        onTap: (){},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 25,
                child: Center(child: Text("${verse.id}", style: TextStyle(color: Colors.blue),))
              ),
            ),
            Expanded(
              flex: 2,
              child: RichText(
                text: TextSpan(text: verse.text, style: DefaultTextStyle.of(context).style),
              ),
            )
          ],
        ),
      ),
    );
  }
}