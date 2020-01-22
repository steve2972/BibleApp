import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class HymnalSearch extends SearchDelegate<String> {
  HymnalSearch({
    String hintText,
    TextInputType textInputType,
  }): super(
    searchFieldLabel: hintText,
    keyboardType: textInputType,
    textInputAction: TextInputAction.search
  );

  final hymns = List<String>.generate(1100, (i) => (i+1).toString());

  final recentHymns = ['1064', '600', '980', '1042'];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Styles.LightAppBarColor,
      primaryTextTheme: TextTheme(title: TextStyle(color: Colors.grey)),
      primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
        color: Styles.lightIcon
      )
    );
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left side of the app bar
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show when someone searches for something
    final suggestionsList = query.isEmpty 
        ? recentHymns
        : hymns.where((p) => p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.history),
        title: Text(suggestionsList[index]),
        onTap: () {
          query = suggestionsList[index];
          showResults(context);
        }
      ),
      itemCount: suggestionsList.length,
      
    );
  }

  @override
  void showResults(BuildContext context) {
    print(query);
  }

}