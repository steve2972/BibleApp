import 'package:bible_test2/UI/Models/Profile/Prayer/PrayerModel.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PrayerTile extends StatelessWidget {
  final PrayerModel model;

  const PrayerTile({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        key: Key(model.content),
        title: Text(model.content),
        trailing: IconButton(icon: Icon(OMIcons.starBorder), color: Colors.yellow[700], onPressed: (){},),
      );
  }
}