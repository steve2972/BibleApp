import 'package:bible_test2/UI/Models/Reader/Books/BookList.dart';
import 'package:bible_test2/UI/Models/Reader/Books/BooksAppBar.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: booksAppBar(context),
      body: BookList(),
    );
  }
}