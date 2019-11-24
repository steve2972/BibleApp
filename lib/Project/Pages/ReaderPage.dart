import 'package:bible_bloc/Feature/InheritedBlocs.dart';
import 'package:bible_bloc/Feature/Navigation/navigation_feature.dart';
import 'package:bible_bloc/Feature/Reader/reader_feature.dart';
import 'package:bible_bloc/Foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ReaderPage extends StatefulWidget {
  const ReaderPage({
    Key key,
  }) : super(key: key);

  @override
  _ReaderPageState createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  ScrollController _controller;
  var _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _controller = new ScrollController();
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      else if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });

  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: InheritedBlocs.of(context).bibleBloc.previousChapter,
        builder: (_, prevChapter) => StreamBuilder(
          stream: InheritedBlocs.of(context).bibleBloc.nextChapter,
          builder: (_, nextChapter) {
            return StreamBuilder<ChapterReference>(
              stream: InheritedBlocs.of(context).bibleBloc.chapterReference,
              builder:
                  (context, AsyncSnapshot<ChapterReference> chapterReference) {
                if (chapterReference.hasData &&
                    prevChapter.hasData &&
                    nextChapter.hasData) {
                  return CustomScrollView(
                    controller: _controller,
                    slivers: <Widget>[
                      BibleReaderAppBar(
                          title:
                              "${chapterReference.data.chapter.book.name} ${chapterReference.data.chapter.number}"),
                      SliverToBoxAdapter(
                        child: Reader(
                          nextChapter: nextChapter.data,
                          previousChapter: prevChapter.data,
                          chapterReference: chapterReference.data,
                          controller: _controller,
                        ),
                      ),
                    ],
                  );
                } else {
                  return CustomScrollView(
                    controller: _controller,
                    slivers: <Widget>[
                      BibleReaderAppBar(
                        title: "Loading...",
                      ),
                      SliverToBoxAdapter(
                        child: LoadingColumn(),
                      ),
                    ],
                  );
                }
              },
              initialData: null,
            );
          },
          initialData: null,
        ),
        initialData: null,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isVisible ? 60.0: 0.0,
        child: _isVisible ? AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: _isVisible ? 60.0: 0.0,
          child: _isVisible ? BibleBottomNavigationBar(context: context) 
          : Container(color: Colors.white, width: MediaQuery.of(context).size.width,),
        )
        : Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
