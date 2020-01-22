import 'package:bible_test2/UI/Models/Navigation/BottomNavigationBar.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Models/Notes/NoteTile.dart';
import 'NoteEditPage.dart';
import 'NoteViewPage.dart';
import '../../Models/Notes/NotesModel.dart';
import '../../Models/Navigation/FadeRoute.dart';
import 'package:bible_test2/Repositories/Notes/NotesDatabase.dart';
import 'package:flutter/painting.dart';
import 'dart:async';

class NotesPage extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  NotesPage({Key key, this.title, Function(Brightness brightness) changeTheme})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool isFlagOn = false;
  bool headerShouldHide = false;
  List<NotesModel> notesList = [];
  TextEditingController searchController = TextEditingController();

  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    NotesDatabaseService.db.init();
    setNotesFromDB();
  }

  setNotesFromDB() async {
    print("Entered setNotes");
    var fetchedNotes = await NotesDatabaseService.db.getNotesFromDB();
    setState(() {
      notesList = fetchedNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Styles.LightAppBarColor,
            elevation: 1,
            pinned: true,
            //centerTitle: true,
            leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios),
              color: Styles.lightIcon,
            ),
            title: Text("신언 노트", style: TextStyle(color: Colors.black),),
            actions: <Widget>[
            
              IconButton(
                icon: Icon(Icons.add),
                color: Styles.lightIcon,
                onPressed: () {Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      EditNotePage(triggerRefetch: refetchNotesFromDB)));},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
              Container(height: 64,),
              ...buildNoteComponentsList(),
              
              Container(height: 100,),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget testListItem(Color color) {
    return new NoteCardComponent(
      noteData: NotesModel.random(),
    );
  }

  Widget buildImportantIndicatorText() {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      firstChild: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          'Only showing notes marked important'.toUpperCase(),
          style: TextStyle(
              fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
        ),
      ),
      secondChild: Container(
        height: 2,
      ),
      crossFadeState:
          isFlagOn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  List<Widget> buildNoteComponentsList() {
    List<Widget> noteComponentsList = [];
    notesList.sort((a, b) {
      return b.date.compareTo(a.date);
    });
    if (searchController.text.isNotEmpty) {
      notesList.forEach((note) {
        if (note.title
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            note.content
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
          noteComponentsList.add(NoteCardComponent(
            noteData: note,
            onTapAction: openNoteToRead,
          ));
      });
      return noteComponentsList;
    }
    if (isFlagOn) {
      notesList.forEach((note) {
        if (note.isImportant)
          noteComponentsList.add(NoteCardComponent(
            noteData: note,
            onTapAction: openNoteToRead,
          ));
      });
    } else {
      notesList.forEach((note) {
        noteComponentsList.add(NoteCardComponent(
          noteData: note,
          onTapAction: openNoteToRead,
        ));
      });
    }
    List<Widget> emptyList = [];
    emptyList.add(GestureDetector(
                onTap: gotoEditNote, 
                child: AddNoteCardComponent(),
              ),);
    return noteComponentsList.length != 0 ? noteComponentsList : emptyList;
  }

  void handleSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

  void gotoEditNote() {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                EditNotePage(triggerRefetch: refetchNotesFromDB)));
  }

  void refetchNotesFromDB() async {
    await setNotesFromDB();
    print("Refetched notes");
  }

  openNoteToRead(NotesModel noteData) async {
    setState(() {
      headerShouldHide = true;
    });
    await Future.delayed(Duration(milliseconds: 230), () {});
    Navigator.push(
        context,
        FadeRoute(
            page: ViewNotePage(
                triggerRefetch: refetchNotesFromDB, currentNote: noteData)));
    await Future.delayed(Duration(milliseconds: 300), () {});

    setState(() {
      headerShouldHide = false;
    });
  }

  void cancelSearch() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      searchController.clear();
      isSearchEmpty = true;
    });
  }
}
