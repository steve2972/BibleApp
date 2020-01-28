import 'package:bible_test2/Blocs/Login/Authentication.dart';
import 'package:bible_test2/UI/Screens/LoginPage/RootPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Blocs/BottomNavigation/NavigationBloc.dart';
import 'UI/theme.dart';

Future main() async {
  runApp(MyApp(
    bottomNavigationBloc: NavigationBloc,
  ));
}

class MyApp extends StatelessWidget {
  final bottomNavigationBloc;

  MyApp({this.bottomNavigationBloc});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      theme: Designs.lightTheme,
      home: RootPage(auth: new Auth()),
    );
  }
}
