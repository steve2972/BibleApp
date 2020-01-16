import 'package:flutter/material.dart';

Widget buildCommonTitleSliver(String title) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),),
    ),
  );
}