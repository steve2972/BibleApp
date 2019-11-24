import 'package:bible_bloc/Feature/InheritedBlocs.dart';
import 'package:bible_bloc/Feature/Reader/reader_feature.dart';
import 'package:bible_bloc/Feature/Search/search_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppPages.dart';

class BibleBottomNavigationBar extends StatelessWidget {
  BibleBottomNavigationBar({
    Key key,
    BuildContext context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppPage>(
        stream: InheritedBlocs.of(context).navigationBloc.currentPage,
        initialData: AppPage.readerPage,
        builder: (context, snapshot) {
          int lastPage = snapshot.data.index;
          return Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
            ),
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              fixedColor: Theme.of(context).primaryColor,
              currentIndex: snapshot.data.index,
              onTap: (index) {
                if (index == AppPage.readerPage.index) {
                  if (lastPage == index) {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(child: BooksList());
                        });
                  } else {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    InheritedBlocs.of(context)
                        .navigationBloc
                        .nextPage
                        .add(AppPage.readerPage);
                  }
                } else if (index == AppPage.homePage.index) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.homePage);
                } else if (index == AppPage.notePage.index) {
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.notePage);
                }
              },
              items: [
                BottomNavigationBarItem(
                  title: Text("홈"),
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  title: Text("성경"),
                  icon: Icon(Icons.book),
                ),
                BottomNavigationBarItem(
                  title: Text("북마크"),
                  icon: Icon(Icons.bookmark_border),
                ),
              ],
            ),
          );
        });
  }
}
