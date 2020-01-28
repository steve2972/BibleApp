import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';

class DistrictSearch extends SearchDelegate<String> {
  DistrictSearch({
    bool iscity,
    String hintText,
  }): super(
    searchFieldLabel: hintText,
    textInputAction: TextInputAction.search
  );

  final cities = {
    "서울특별시",
    "부산광역시",
    "인천광역시",
    "용인시",
    "대구광역시",
    "대전광역시",
    "광주광역시",
    "수원시",
    "울산광역시",
    "창원시",
    "고양시",
    "세종특별자치시",
  };

  final popularCities = ['서울특별시', '인천광역시', '용인시', '대전광역시'];

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
        ? popularCities
        : cities.where((p) => p.startsWith(query)).toList();

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
    Navigator.pop(context, query);
  }

}