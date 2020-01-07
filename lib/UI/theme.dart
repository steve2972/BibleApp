// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Designs {
  static ThemeData darkTheme = getDarkTheme();
  static ThemeData lightTheme = getLightTheme();

  static TextTheme darkTextTheme =
      TextTheme(body2: TextStyle(color: Colors.white70, fontSize: 18.0));
  
  static TextTheme lightTextTheme =
      TextTheme(body2: TextStyle(color: Colors.black, fontSize: 18.0));

  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey.shade100,
  );

  static ThemeData getDarkTheme() {
    ThemeData darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
      textSelectionColor: Colors.blueAccent.shade200,
      textSelectionHandleColor: Colors.white,
      textTheme: darkTheme.textTheme.copyWith(
        body2: darkTheme.textTheme.body2.copyWith(
          color: Colors.white70,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        display1: darkTheme.textTheme.display1.copyWith(
          color: Colors.white70,
          fontSize: 22.0,
        ),
        title: darkTheme.textTheme.title.copyWith(
          color: darkTheme.primaryColor,
        ),
      ),
      iconTheme: darkTheme.iconTheme.copyWith(color: Colors.white70),
      buttonColor: Colors.blue.shade900,
      accentColor: Colors.blue.shade900,
    );
  }

  static ThemeData getLightTheme() {
    ThemeData lightTheme = ThemeData.light();
    return lightTheme.copyWith(
      textSelectionColor:  Colors.yellow.shade300,
      textSelectionHandleColor: Colors.black,
      textTheme: lightTheme.textTheme.copyWith(
        body2: lightTheme.textTheme.body2.copyWith(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        display1: lightTheme.textTheme.display1.copyWith(
          color: Colors.black,
          fontSize: 22.0,
        ),
        title: lightTheme.textTheme.title.copyWith(
          color: lightTheme.primaryColor,
        ),
      ),
      iconTheme: lightTheme.iconTheme.copyWith(color: Colors.black),
      primaryColor: Colors.blue,
      accentColor: Colors.blue.shade200,
      buttonColor: Colors.blue.shade200,
    );
  }
}

abstract class Styles {
  static const Color productRowDivider = Color(0xFFD9D9D9);

  static const Color scaffoldBackground = Color(0xfff0f0f0);

  static const Color searchBackground = Color(0xffe0e0e0);

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const Color LightAppBarColor = Color(0xFFFAFAFA);

  static const Color DarkAppBarColor = Color(0x1b1b1b);

  static const Color lightIcon = Color(0xFF757575);

  static const Color darkIcon = Color(0xFFE0E0E0);

  Color background_color = Colors.grey[200];

  static const TextStyle mainText = TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 26,
                color: Color(0xFF2196F3));

  static const TextStyle mainTextBlack = TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 26,
                color: Colors.black);

  static const TextStyle titleText = TextStyle(
    fontFamily: 'ZillaSlab',
    fontSize: 18,
    fontWeight: FontWeight.normal
  );

  static  TextStyle readText = TextStyle(
    fontFamily: 'ZillaSlab',
    fontSize: 14,
    color: Colors.grey.shade400,
  );
  static  TextStyle readTextBlack = TextStyle(
    fontFamily: 'ZillaSlab',
    fontSize: 14,
    color: Colors.black,
  );
}