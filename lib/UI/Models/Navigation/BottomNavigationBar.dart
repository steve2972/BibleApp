import 'package:bible_test2/Blocs/InheritedBlocs.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bible_test2/Blocs/BottomNavigation/AppPages.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class BibleBottomNavigationBar extends StatelessWidget {
  BibleBottomNavigationBar({
    Key key,
    BuildContext context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppPage>(
        stream: InheritedBlocs.of(context).navigationBloc.currentPage,
        initialData: AppPage.homePage,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              fixedColor: Theme.of(context).primaryColor,
              currentIndex: snapshot.data.index,
              onTap: (index) {
                if (index == AppPage.readerPage.index) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.readerPage);
                } else if (index == AppPage.homePage.index) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.homePage);
                } else if (index == AppPage.profilePage.index) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.profilePage);
                } else if (index == AppPage.notePage.index) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.notePage);
                } else if (index == AppPage.menuPage.index) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.menuPage);
                }
              },
              items: [
                BottomNavigationBarItem(
                  title: Text("홈"),
                  icon: Icon(OMIcons.home),
                ),
                BottomNavigationBarItem(
                  title: Text("Profile"),
                  icon: Icon(CupertinoIcons.profile_circled)
                ),
                BottomNavigationBarItem(
                  title: Text("성경"),
                  icon: Icon(OMIcons.book),
                ),
                BottomNavigationBarItem(
                  title: Text("북마크"),
                  icon: Icon(Icons.bookmark_border),
                ),
                BottomNavigationBarItem(
                  title: Text("Menu"),
                  icon: Icon(Icons.menu),
                )
              ],
            );
        });
  }
}