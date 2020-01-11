import 'package:bible_test2/UI/Models/Reader/Books/BookModel.dart';
import 'package:bible_test2/UI/Models/Reader/Books/BooksTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  final List<Book> _books;

  BookList({books}) : _books = books;

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: ((context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Divider(
            color: Colors.grey.withOpacity(0.3),
            height: 18.0,
          ),
        );
      }),
      itemCount: initialBooks.length,
      itemBuilder: ((context, index) {
        return BooksTile(bookData: new Book(initialBooks[index].title, initialBooks[index].author,
                                            initialBooks[index].description, initialBooks[index].image),);
      }),
    );
  }
}