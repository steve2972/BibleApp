import 'dart:async';
import 'package:bible_test2/Repositories/Bible/BibleDatabaseHelper.dart';
import 'package:bible_test2/Repositories/Bible/KorBibleDatabaseHelper.dart';
import 'package:bloc/bloc.dart';
import 'Verse.dart';
import 'verse_event.dart';
import 'verse_state.dart';

class VerseBloc extends Bloc<VerseEvent, VerseState> {
  final dbHeper = BibleDatabaseHelper.instance;

  @override
  VerseState get initialState => VerseInitial();

  @override
  Stream<VerseState> mapEventToState(VerseEvent event,) async* {
    if (event is GetVerse) {
      // Outputting a state from the asynchronous generator
      final chapter = await _fetchChapter(event.chapterNum);
      yield VerseLoaded(verses: chapter, chapterNum:event.chapterNum);
    }

    if (event is IncrementChapter && event.isIncrement) {
      final chapter = await _fetchChapter(event.chapterNum + 1);
      yield VerseLoaded(verses: chapter, chapterNum: event.chapterNum+1);
    }

    if (event is IncrementChapter && !event.isIncrement) {
      final chapter = await _fetchChapter(event.chapterNum-1);
      yield VerseLoaded(verses: chapter, chapterNum: event.chapterNum-1);
    }

    if (event is GetKorVerse) {
      final chapter = await _fetchKoreanChapter(event.chapterNum);
      yield VerseLoaded(verses: chapter, chapterNum: event.chapterNum);
    }

    if (event is IncrementKorChapter) {
      if (event.isIncrement) {
        final chapter = await _fetchKoreanChapter(event.chapterNum + 1);
        yield VerseLoaded(verses: chapter, chapterNum: event.chapterNum+1);
      }
      else if (!event.isIncrement) {
        final chapter = await _fetchKoreanChapter(event.chapterNum-1);
        yield VerseLoaded(verses: chapter, chapterNum: event.chapterNum-1);
      }
    }
  }

  Future<List<Verse>> _fetchChapter(int chapterNum) async {
    return await dbHeper.queryChapter(chapterNum);
  }

  Future<List<Verse>> _fetchKoreanChapter(int chapterNum) async {
    return await KorBibleDatabaseHelper.instance.queryChapter(chapterNum);
  }

  void increment(int cur) => this.add(IncrementChapter(isIncrement: true, curChapter: cur));
  void decrement(int cur) => this.add(IncrementChapter(isIncrement: false, curChapter: cur));
  void goTo(int to) => this.add(GetVerse(number: to));

  void korincrement(int cur) => this.add(IncrementKorChapter(isIncrement: true, curChapter: cur));
  void kordecrement(int cur) => this.add(IncrementKorChapter(isIncrement: false, curChapter: cur));
  void korgoTo(int to) => this.add(GetKorVerse(number: to));

}
