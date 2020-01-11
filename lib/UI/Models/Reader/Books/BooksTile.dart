import 'package:bible_test2/UI/Models/Reader/Books/BookCover.dart';
import 'package:bible_test2/UI/Models/Reader/Books/BookModel.dart';
import 'package:flutter/material.dart';

class BooksTile extends StatelessWidget {
  final Book bookData;

  BooksTile({
    @required this.bookData
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
        height: 260,
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: BookCover(url: bookData.image,),
            ),
            Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 18.0, 0.0, 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${bookData.title}',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'By ${bookData.author}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}