
import 'package:bible_test2/Repositories/Bible/BibleList.dart';

String chapterToBook(int chapter) {
  final chapters = Bible.chapters;
  final books = Bible.books;

  int index = 0;
  while(chapters[index] < chapter) index++;

  return "${books[index]} ${chapter > 50 ? chapter - chapters[index-1] : chapter}";
  
}

