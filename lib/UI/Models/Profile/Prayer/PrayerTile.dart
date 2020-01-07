import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerModel.dart';
import 'package:flutter/material.dart';

class PrayerTile extends StatelessWidget {
  final PrayerModel model;
  final Function(PrayerModel model) onTapAction;

  const PrayerTile({
    this.model,
    this.onTapAction,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.content),
      
    );
  }
}