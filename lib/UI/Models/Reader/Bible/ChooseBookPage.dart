import 'package:bible_test2/Repositories/Bible/BibleList.dart';
import 'package:bible_test2/UI/Models/Reader/ReaderChapterView.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseBookPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: Text("Recovery Version", style: TextStyle(color: Colors.blue),),
        backgroundColor: Styles.LightAppBarColor,
        leading: IconButton(icon: Icon(CupertinoIcons.back, color: Theme.of(context).primaryColor,)
        , onPressed: () {Navigator.pop(context);},),
        
      ),

      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index], context),
        itemCount: data.length,
      ),
    );
  }
}

class Entry {
  final String title;
  final List<SubTitle> subTitles;

  Entry(this.title, [this.subTitles= const <SubTitle>[]]);
}

class SubTitle {
  final String title;
  final List<BookChapters> chapters;

  SubTitle(this.title, [this.chapters = const <BookChapters>[]]);
}

class BookChapters {
  final String title;
  final int chapterStart;
  BookChapters(this.title, this.chapterStart);
}

final List<Entry> data = <Entry>[
  Entry(
    '구약 회복역',
    <SubTitle>[
      SubTitle(
        '모세오경',
        <BookChapters>[
          BookChapters('Genesis', 1),
          BookChapters('Exodus',51),
          BookChapters('Leviticus', 91),
          BookChapters('Numbers', 118),
          BookChapters('Deuteronomy', 154),
        ],
      ),
      SubTitle(
        'Old Testament Narrative',
        <BookChapters>[
          BookChapters('Joshua', 188),
          BookChapters('Judges', 212),
          BookChapters('Ruth', 233),
          BookChapters('1 Samuel', 237),
          BookChapters('2 Samuel', 268),
          BookChapters('1 Kings', 292),
          BookChapters('2 Kings', 314),
          BookChapters('1 Chronicles', 339),
          BookChapters('2 Chronicles', 368),
          BookChapters('Ezra', 404),
          BookChapters('Nehemiah', 414),
          BookChapters('Esther', 427),
        ]
      ),
      SubTitle(
        'Wisdom Literature',
        <BookChapters>[
          BookChapters('Job', 437),
          BookChapters('Psalms', 479),
          BookChapters('Proverbs', 629),
          BookChapters('Ecclesiastes', 660),
          BookChapters('Song of Songs', 672),

        ]
      ),
      SubTitle(
        'Major Prophets',
        <BookChapters>[
          BookChapters('Isaiah', 680),
          BookChapters('Jeremiah', 746),
          BookChapters('Lamentations', 798),
          BookChapters('Ezekial', 803),
          BookChapters('Daniel', 851),
        ]
      ),
      SubTitle(
        'Minor Prophets',
        <BookChapters>[
          BookChapters('Hosea', 863),
          BookChapters('Joel', 877),
          BookChapters('Amos', 880),
          BookChapters('Obadiah',889),
          BookChapters('Jonah',890),
          BookChapters('Micah', 894),
          BookChapters('Nahum', 901),
          BookChapters('Habakkuk', 904),
          BookChapters('Zephaniah', 907),
          BookChapters('Haggai', 910),
          BookChapters('Zechariah', 912),
          BookChapters('Malachai', 926),
        ]
      ),
    ],
  ),
  Entry(
    '신약 회복역',
    <SubTitle>[
      SubTitle(
        'New Testament Narrative',
        <BookChapters>[
          BookChapters('Matthew', 930),
          BookChapters('Mark', 958),
          BookChapters('Luke', 974),
          BookChapters('John', 998),
          BookChapters('Acts', 1019),
        ],
      ),
      SubTitle(
        'Pauline Epistles',
        <BookChapters>[
          BookChapters('Romans', 1047),
          BookChapters('1 Corinthians', 1063),
          BookChapters('2 Corinthians', 1079),
          BookChapters('Galations', 1092),
          BookChapters('Ephesians', 1098),
          BookChapters('Philippians', 1104),
          BookChapters('Colossians', 1108),
          BookChapters('1 Thessalonians', 1112),
          BookChapters('2 Thessalonians', 1117),
          BookChapters('1 Timothy', 1120),
          BookChapters('2 Timothy', 1126),
          BookChapters('Titus', 1130),
          BookChapters('Philemon', 1133),
        ]
      ),
      SubTitle(
        'General Epistles',
        <BookChapters>[
          BookChapters('Hebrews', 1134),
          BookChapters('James', 1147),
          BookChapters('1 Peter', 1152),
          BookChapters('2 Peter', 1157),
          BookChapters('1 John', 1160),
          BookChapters('2 John', 1165),
          BookChapters('3 John', 1166),
          BookChapters('Jude', 1167),

        ]
      ),
      SubTitle(
        'Apocalyptic Epistle',
        <BookChapters>[
          BookChapters('Revelation', 1168),
        ]
      ),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  final Entry entry;
  final BuildContext context;

  const EntryItem(this.entry, this.context);

  Widget _buildTiles(Entry root) {
    if (root.subTitles.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.subTitles.map(_buildSubTitles).toList(),
    );
  }

  Widget _buildSubTitles(SubTitle subTitle) {
    if (subTitle.chapters.isEmpty) return ListTile(title: Text(subTitle.title),);
    return ExpansionTile(
      leading: IconButton(icon: Icon(Icons.star_border), onPressed: (){

      },),
      key: PageStorageKey<SubTitle>(subTitle),
      title: Text(subTitle.title),
      children: subTitle.chapters.map(_buildBookChapters).toList(),
    );
  }

  Widget _buildBookChapters(BookChapters bookChapters) {
    return 
    FlatButton(
      child: ListTile(
        title: Text(bookChapters.title,),
      ),
      onPressed: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ChapterView(bookChapters.chapterStart)));
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
