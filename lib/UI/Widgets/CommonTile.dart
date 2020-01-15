import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:flutter/material.dart';


Widget buildCommonTile(BuildContext context, IconData icon, String label, Widget route) {
    return FlatButton(
      onPressed: () {cupertinoNavigate(context, route);},
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        trailing: Icon(Icons.arrow_forward_ios, size: 14,),
      ),
    );
  }