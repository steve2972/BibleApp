import 'package:bible_test2/Blocs/BibleProvider/verse_bloc.dart';
import 'package:bible_test2/Blocs/BibleProvider/verse_event.dart';
import 'package:bible_test2/Blocs/BibleProvider/verse_state.dart';
import 'package:bible_test2/Blocs/Functions/chapterToBook.dart';
import 'package:bible_test2/Repositories/Bible/BibleList.dart';
import 'package:bible_test2/UI/Models/Reader/Bible/KorVerseWidget.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KoreanReaderPage extends StatefulWidget {
  int chapter;
  KoreanReaderPage(this.chapter);
  @override
  _KoreanReaderPageState createState() => new _KoreanReaderPageState(chapter);
}

class _KoreanReaderPageState extends State<KoreanReaderPage> {
  
  final _scrollController = ScrollController();
  VerseBloc _verseBloc;
  final int cur;
  double fontSize = 16.0;

  _KoreanReaderPageState(this.cur);
  

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _verseBloc = VerseBloc()..add(GetKorVerse(number: cur));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "회복역 성경",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightGreen
              ),
            ),
            ListTile(
              leading: IconButton(icon: Icon(Icons.chevron_left), 
                onPressed: (){
                  if (fontSize > 12) {
                    setState(() {
                      fontSize--;
                    });
                  }
                  
                },
              ),
              title: Center(child:Text("폰트 크기: ${fontSize.toInt() - 4}"),),
              trailing: IconButton(icon: Icon(Icons.chevron_right), 
                onPressed: (){
                  if (fontSize < 22) {
                    setState(() {
                      fontSize++;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: _verseBloc,
        builder: (context, state) {
          if (state is VerseUnintialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is VerseLoaded) {
            if (state.verses.isEmpty) {
              return Center(child: Text("No Verses"),);
            }
            return CustomScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Styles.LightAppBarColor,
                  floating: true,
                  elevation: 1.5,
                  centerTitle: true,
                  title: Row(children: <Widget> [
                      Text(chapterToBook(state.chapterNum + 929), style: TextStyle(color: Colors.black),),
                      IconButton(icon: Icon(Icons.arrow_drop_down, color: Styles.lightIcon,),
                      onPressed: () {
                        showModalBottomSheet(context: context, builder: (builder) {
                          return GridView.count(
                            physics: BouncingScrollPhysics(),
                            childAspectRatio: 1.0,
                            padding: const EdgeInsets.all(12.0),
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                            crossAxisCount: 4,
                            children: List.generate(getNumChapters(state.chapterNum + 929), (int index) 
                            => 
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(64)
                              ),
                              color: Colors.grey[300],
                              child: Text('${index + 1}장', style: TextStyle(fontSize: 18),),
                              onPressed: (){
                                _verseBloc.korgoTo(getChapterOffset(state.chapterNum, index+1));
                                _scrollToTop();
                              })
                            )
                          );
                        });
                      },)
                    ]
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Styles.lightIcon,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.menu),
                        color: Styles.lightIcon,
                        onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                      )
                  ]
                ),
                SliverToBoxAdapter(child: Container(height: 45,),),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return KorVerseWidget(fontSize: fontSize, verse: state.verses[index]);

                  }, childCount: state.verses.length),
                ),
                SliverToBoxAdapter(child: Container(height: 45,),),
                SliverToBoxAdapter(
                  child: 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0, 32, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              _verseBloc.korincrement(state.chapterNum);
                              _scrollToTop();
                            },
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.check, color: Colors.white,),
                                Text("다음 장", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: Container(height: 45,),),
              ],
            );
          }
          else {return Center(child: CircularProgressIndicator(),);}
        },
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
  }

  void _scrollToTop() {
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
  }
}