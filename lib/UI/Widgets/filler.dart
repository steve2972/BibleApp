import 'package:flutter/material.dart';

class Filler extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 8,
        color: Colors.grey[300],
      ),
    );
  }
}
