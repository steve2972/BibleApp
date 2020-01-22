import 'package:bible_test2/Blocs/BibleProvider/Verse.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class KorVerseWidget extends StatefulWidget {
  final Verse verse;
  final double fontSize;

  const KorVerseWidget({Key key, this.fontSize = 14.0, @required this.verse}) : super(key: key);
  
  @override
  KorVerseWidgetState createState() => KorVerseWidgetState(verse: verse, fontSize: fontSize);
}

class KorVerseWidgetState extends State<KorVerseWidget> {
  final Verse verse;
  final double fontSize;
  KorVerseWidgetState({Key key, this.fontSize = 14.0, @required this.verse});
  
  /* Local constructor variables */
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet(
            elevation: 0,
            backgroundColor: Styles.LightAppBarColor,
            context: context,
            builder: (builder) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildButtonRow(context),
                      SizedBox(height: 16,),
                      _buildVerseTile(context),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 16, 0, 16),
                        child: Text("노트", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 16, 0, 16),
                        child: Text("각주", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              );
            }
          );
        },
        child: _buildVerseTile(context)
      ),
    );
  }

  Widget _buildVerseTile(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 25,
            child: Center(child: Text("${verse.id}", style: TextStyle(color: Colors.blue, fontSize: fontSize),))
          ),
        ),
        Expanded(
          flex: 2,
          child: RichText(
            text: TextSpan(text: verse.text, style: DefaultTextStyle.of(context).style.copyWith(fontSize: fontSize)),
          ),
        )
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: isSaved ? Icon(Icons.bookmark, color: Colors.orange,): Icon(Icons.bookmark_border),
          color: Styles.lightIcon,
          onPressed: (){
            setState(() {
              isSaved = !isSaved;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          color: Styles.lightIcon,
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.add),
          color: Styles.lightIcon,
          onPressed: (){},
        ),
      ],
    );
  }
}