import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[50],
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      title: Text("Settings", style: TextStyle(color: Theme.of(context).primaryColor),),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), color: Colors.grey, onPressed: () {
          showSearch(context: context, delegate: SettingsSearch());
        },)
      ],
      
    );
  }
}

class SettingsSearch extends SearchDelegate<String> {
  final cities = [
    "Aberdeen",
"Abilene",
"Akron",
"Albany",
"Albuquerque",
"Alexandria",
"Allentown",
"Amarillo",
"Anaheim",
"Anchorage",
"Ann Arbor",
"Antioch",
"Apple Valley",
"Appleton",
"Arlington",
"Arvada",
"Asheville",
"Athens",
"Atlanta",
"Atlantic City",
"Augusta",
"Aurora",
"Austin",
"Bakersfield",
"Baltimore",
"Barnstable",
"Baton Rouge",];

  final recentCities = ["Atlanta",
"Atlantic City",
"Augusta",
"Aurora",];


  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          
        },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left side of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
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
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.local_activity),
      title: Text(suggestionsList[index]),),
      itemCount: suggestionsList.length,
    );
  }

}