import 'Feature/InheritedBlocs.dart';
import 'Feature/Navigation/navigation_feature.dart';
import 'Feature/Notes/notes_feature.dart';
import 'Feature/Reader/reader_feature.dart';
import 'Feature/Search/search_feature.dart';
import 'Feature/Settings/settings_feature.dart';
import 'Foundation/foundation.dart';
import 'Project/Designs/AppThemes.dart';
import 'Project/Pages/HomePage.dart';
import 'Project/Pages/ReaderPage.dart';
import 'Project/Pages/NotesPage.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings");
  final bibleBloc = BibleBloc(MultiPartXmlBibleProvider());
  runApp(MyApp(
    bibleBloc: bibleBloc,
    settingsBloc: SettingsBloc(),
  ));
}

class MyApp extends StatelessWidget {
  final bibleBloc;
  final settingsBloc;

  MyApp({this.bibleBloc, this.settingsBloc});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InheritedBlocs(
      bibleBloc: bibleBloc,
      settingsBloc: settingsBloc,
      notesBloc: NotesBloc(),
      navigationBloc: NavigationBloc(),
      searchBloc: SearchBloc(XmlBibleProvider()),
      child: MaterialApp(
        theme: Designs.lightTheme,
        home: MyHomePage(
          bibleBloc: bibleBloc,
        ),
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
          case AppPage.readerPage:
            return ReaderPage();
            break;

          case AppPage.homePage:
            return HomePage();
            break;

          case AppPage.notePage:
            return NotesPage();
            break;
          default:
            return HomePage();
            break;
        }
      },
      initialData: null,
    );
  }
}
