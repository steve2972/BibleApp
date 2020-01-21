import 'package:bible_test2/Repositories/Hymnal/HymnalSearch.dart';
import 'package:bible_test2/UI/Models/Reader/Hymnal/HymnalAppBar.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

enum searchType {number, title, author}
enum hymnalType {regular, english, youngPeople, children}


class HymnalEntryPage extends StatefulWidget{
  @override
  HymnalEntryPageState createState() => HymnalEntryPageState();
}

class HymnalEntryPageState extends State<HymnalEntryPage> {
  TextEditingController _controller;
  FocusNode node;
  var names = ["번호", "제목", "작가"];
  static const hymnalNames = <String>["찬송가", "영어 찬송가", "내마음의노래", "어린이 찬송"];
  searchType type = searchType.number;
  hymnalType hymnType = hymnalType.regular;
  String title = hymnalNames[0];
  
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
    node = new FocusNode();

  }

  bool _isValid = true;
  bool _isNumberSearch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hymnalAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 32,),
          _buildHeaderWidget(context),
          Container(height: 32,),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 16,),
                  Text(
                    _returnHymnalType(type),
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.mic, color: Colors.green,),
                    onPressed: (){},
                  )
                ],
              ),

              onPressed: () {
                showSearch(
                  context: context,
                  delegate: HymnalSearch(
                    hintText: _returnHymnalType(type), 
                    textInputType: _isNumberSearch ? TextInputType.number: TextInputType.text,
                  )
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildRadioButton(searchType.number),
              _buildRadioButton(searchType.title),
              _buildRadioButton(searchType.author),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    node.dispose();
    _controller.dispose();

    super.dispose();
  }

  void onRadioChange(searchType value) {
    setState(() {
      type = value;
      if (value != searchType.number) _isNumberSearch = false;
      else _isNumberSearch = true;
      print("type changed to $value and number = $_isNumberSearch");
      _controller.clear();
    });
  }

  Widget _buildRadioButton(searchType t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: t,
          groupValue: type,
          onChanged: onRadioChange,
        ),

        Text("${names[t.index]}")
      ],
    );
  }

  String _returnHymnalType(searchType t) {
    switch (t) {
      case searchType.number:
        return "찬송가 번호:";
        break;
      case searchType.title:
        return "찬송가 제목:";
        break;
      case searchType.author:
        return "찬송가 작가:";
        break;
      default:
        return "찬송가:";
    }
  }

  final List<PopupMenuItem<String>> _popUpMenuItems = hymnalNames.map(
    (String value) => PopupMenuItem<String>(
      value: value,
      child: Text(value),
    )
  ).toList();

  Widget _buildHeaderWidget(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note, color: Styles.LightAppBarColor,),
      title: Center(child: Text("$title", style: TextStyle(fontSize: 36),)),
      trailing: new PopupMenuButton<String>(
          onSelected: (String newValue) {
            setState(() {
              title = newValue;
              hymnType = hymnalType.values[hymnalNames.indexOf(newValue)];
              print("hymn type: $hymnType");
            });
          },
          itemBuilder: (BuildContext context) => _popUpMenuItems
        ),
    );
  }
}