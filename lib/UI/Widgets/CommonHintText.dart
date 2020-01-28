import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:flutter/material.dart';

Widget commonHintText(BuildContext context, String hint, Widget route) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: 
    GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Text(hint, style: TextStyle(fontSize: 16, color: Colors.grey[600]),),
        ),
      ),
      onTap: () {
        cupertinoNavigate(context, route);
      },
    ),
  );
}