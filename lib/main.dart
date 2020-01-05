import 'package:bible_test2/UI/Screens/MenuPage.dart';
import 'package:bible_test2/UI/Screens/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'Blocs/InheritedBlocs.dart';
import 'Blocs/BottomNavigation/NavigationBloc.dart';
import 'Blocs/BottomNavigation/AppPages.dart';
import 'UI/Screens/pages.dart';
import 'UI/theme.dart';

void main() async {
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
    return InheritedBlocs(
      navigationBloc: NavigationBloc(),
      child: MaterialApp(
        theme: Designs.lightTheme,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.bibleBloc}) : super(key: key);
  final bibleBloc;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppPage>(
      stream: InheritedBlocs.of(context).navigationBloc.currentPage,
      builder: (context, currentPageSnapshot) {
        switch (currentPageSnapshot.data) {
          case AppPage.homePage:
            return HomePage();
            break;
          case AppPage.profilePage:
            return ProfilePage();
            break;
          case AppPage.readerPage:
            return ReaderPage();
            break;
          case AppPage.notePage:
            return NotesPage();
            break;
          case AppPage.menuPage:
            return MenuPage();
            break;
          default:
            break;
        }
      },
      initialData: null,
    );
  }
}