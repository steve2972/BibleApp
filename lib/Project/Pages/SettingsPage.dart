import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
//import 'package:notus/notus.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설정"),
      ),
      body: PreferencePage([
        PreferenceTitle('일반'),
        DropdownPreference(
          'Start Page',
          'start_page',
          defaultVal: '성경',
          values: ['홈', '성경', '노트'],
        ),
        PreferenceTitle('앱 테마'),
        RadioPreference(
          '밝은 테마',
          'light',
          'ui_theme',
          isDefault: true,
          onSelect: () {
          },
        ),
      ]),
    );
  }
}
