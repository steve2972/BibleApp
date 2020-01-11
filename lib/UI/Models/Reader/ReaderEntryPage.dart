import 'package:bible_test2/UI/Models/Reader/Bible/ChooseBookPage.dart';
import 'package:bible_test2/UI/Models/Reader/ReaderChapterView.dart';
import 'package:bible_test2/UI/Screens/ReaderPage/BooksListPage.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReaderEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Styles.lightIcon,
          onPressed: (){},
        ),
        backgroundColor: Styles.LightAppBarColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 100,),
          Center(child: Text("한국복음서원", style: TextStyle(fontSize: 36))),
          Container(height: 40,),
          Divider(color: Colors.red, indent: 110, endIndent: 110,thickness: 2,),
          Spacer(),
          Row(
            children: <Widget>[
              _buildBookTile(context, Icons.collections_bookmark, "성경", Colors.deepOrange.withOpacity(0.7), ChooseBookPage()),
              _buildBookTile(context, Icons.music_note, "찬송가", Colors.blue.withOpacity(0.6), ChapterView(998)),
            ],
          ),
          Row(
            children: <Widget>[
              _buildBookTile(context, Icons.local_library, "도서", Colors.indigo.withOpacity(0.7), BookListPage()),
              _buildBookTile(context, Icons.playlist_add, "기타", Colors.green.withOpacity(0.6), ChapterView(1)),
            ],
          ),
          Container(height: 100,)

        ],
      ),
    );
  }

  Widget _buildBookTile(BuildContext context, IconData icon, String label, Color color, Widget route) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
      },
      child: Container(
        height: 100,
        width: 160,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(26),
              alignment: Alignment.centerRight,
              child: Opacity(
                opacity: 0.3,
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, color: Colors.white),
                  const SizedBox(height: 16,),
                  Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}