import 'package:bible_test2/UI/Models/Reader/Books/BookModel.dart';
import 'package:bible_test2/UI/Models/Reader/Books/BooksTile.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class BookList extends StatelessWidget {
  final List<Book> _books;

  BookList({books}) : _books = books;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          elevation: 1,
          floating: true,
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("보관함", style: Styles.mainTextBlack),
            centerTitle: true,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.blue,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Styles.LightAppBarColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
              color: Styles.lightIcon,
            ),
            IconButton(
              icon: Icon(OMIcons.shoppingCart),
              onPressed: (){},
              color: Styles.lightIcon,
            )
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BooksTile(bookData: new Book(initialBooks[index].title, initialBooks[index].author,
                            initialBooks[index].description, initialBooks[index].image),),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.3),
                      height: 18.0,
                    ),
                  ),
                ],
              );
            },
            childCount: initialBooks.length,
            
          ),
        )
      ],
    );
  }
}