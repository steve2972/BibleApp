import 'package:bible_test2/Blocs/BibleProvider/Verse.dart';
import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  final Verse verse;

  const VerseWidget({Key key, @required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 8),
      child: FlatButton(
        onPressed: (){
          
        },
        child: 
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right:8.0),
                width: 30,
                child: Text(
                '${verse.id}',
                style: TextStyle(fontSize: 16.0, color: Theme.of(context).primaryColor)),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Text(verse.text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
              ),

            ],
          ),
        ),
      ),
    );
  }
}