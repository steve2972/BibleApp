import 'package:bible_test2/Blocs/BibleProvider/verse_bloc.dart';
import 'package:bible_test2/Blocs/BibleProvider/verse_event.dart';
import 'package:bible_test2/Blocs/BibleProvider/verse_state.dart';
import 'package:bible_test2/UI/Models/Reader/VerseWidget.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChapterView extends StatefulWidget {
  @override
  _ChapterViewState createState() => new _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  
  final _scrollController = ScrollController();
  VerseBloc _verseBloc;
  SharedPreferences _prefs;
  String numKey = "chapter_number_preference";
  int _chapterNumberPref = 998;
  

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
    ..then((prefs) {
      setState(() => this._prefs);
      _loadChapterNum();
    });
    _scrollController.addListener(_onScroll);
    _verseBloc = VerseBloc()..add(GetVerse(number: _chapterNumberPref));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
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
                pinned: true,
                elevation: 1.5,
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 30, bottom: 12),
                  title: Text("Chapter: ${state.chapterNum}", style: Styles.mainText,),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(OMIcons.libraryBooks),
                    color: Theme.of(context).brightness == Brightness.light ? Styles.lightIcon : Styles.darkIcon,
                    onPressed: () {
                    },
                    ),
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      color: Styles.lightIcon,
                      onPressed: (){},
                    )
                ]
              ),
              SliverToBoxAdapter(child: Container(height: 45,),),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return VerseWidget(verse: state.verses[index],);
                }, childCount: state.verses.length),
              ),
              SliverToBoxAdapter(child: Container(height: 45,),),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue, 
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        this._decrementChapterNum();
                        _verseBloc.decrement(state.chapterNum);
                        _scrollToTop();
                      } 
                      ),
                    IconButton(
                      color: Colors.blue, 
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: (){
                        this._incrementChapterNum();
                        _verseBloc.increment(state.chapterNum);
                        _scrollToTop();
                      } 
                      ),

                  ],
                ),
              ),
              SliverToBoxAdapter(child: Container(height: 45,),),
            ],
          );
        }
        else {return Center(child: CircularProgressIndicator(),);}
      },
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
  }

  void _scrollToTop() {
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
  }

  _loadChapterNum() async {
    final _prefs = await SharedPreferences.getInstance();
    setState(() {
      _chapterNumberPref = (_prefs.getInt(numKey) ?? 998);
      _prefs.setInt(numKey, _chapterNumberPref);
      print('cur: $_chapterNumberPref');
    });
  }

  Future<Null> _incrementChapterNum() async {
    final _prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefs.setInt(numKey, _chapterNumberPref + 1);
    });
  }
  Future<Null> _decrementChapterNum() async {
    final _prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefs.setInt(numKey, _chapterNumberPref - 1);
    });
  }

}