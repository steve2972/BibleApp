import 'package:bible_test2/Blocs/BibleProvider/Verse.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VerseEvent extends Equatable{
  final int chapterNum;
  @override
  List<Object> get props => [chapterNum];

  VerseEvent({@required this.chapterNum});
}

class GetVerse extends VerseEvent {
  final int number;

  GetVerse({this.number}) : super(chapterNum: number);
}

class IncrementChapter extends VerseEvent {
  final bool isIncrement;
  final int curChapter;

  IncrementChapter({this.isIncrement, this.curChapter}) : super(chapterNum: curChapter);
}

class GetVerseNum extends VerseEvent {
  final int curChapter;
  
  GetVerseNum(this.curChapter) : super(chapterNum: curChapter);
}

/* Korean Bible Verse Events */

class GetKorVerse extends VerseEvent {
  final int number;

  GetKorVerse({this.number}) : super(chapterNum: number);
}

class IncrementKorChapter extends VerseEvent {
  final bool isIncrement;
  final int curChapter;

  IncrementKorChapter({this.isIncrement, this.curChapter}) : super(chapterNum: curChapter);
}



/* Save verse history */
class SaveVerse extends VerseEvent {
  final Verse verse;

  SaveVerse({this.verse}) : super(chapterNum: verse.chapter);
}