import 'package:bible_test2/Blocs/BibleProvider/Verse.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';


class KorBibleDatabaseHelper {
  static final verseTable = 'Verse';
  static final verseNum = 'Number';
  static final verseText = 'Text';
  static final verseChapterId = 'ChapterId';


  // Singleton use of bible database
  KorBibleDatabaseHelper._privateConstructor();
  static final KorBibleDatabaseHelper instance = KorBibleDatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // Lazily instantiate the database when it is first called
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    // Construct the path to the app's writable database file:
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "KorBibleDb.db");

    await deleteDatabase(dbPath);

    ByteData data = await rootBundle.load("assets/bible/NTRecovery.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

    return await openDatabase(dbPath);
  }

  // Helper methods


  // All of the rows are returned as a list of maps, where each map is 
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(verseTable);
  }

  // Get all verses of a chapter
  Future<List<Verse>> queryChapter(int chapterNum) async {
    Database db = await instance.database;
    List<Map> results = await db.rawQuery('''
    SELECT * 
    FROM $verseTable
    WHERE $verseChapterId=$chapterNum
    ORDER BY $verseNum;
    ''');

    List<Verse> verses = new List();
    results.forEach((result) {
      Verse verse = Verse.fromMap(result);
      verses.add(verse);
    });

    return verses;
  }

  Future<int> queryVerseLength(int chapterNum) async {
    Database db = await instance.database;
    List<Map> results = await db.rawQuery(
      '''
      SELECT COUNT(*)
      FROM $verseTable
      WHERE $verseChapterId=$chapterNum;
      '''
    );

    return results.first[0];
  }

  Future<int> getChapterNum(int chapterNum) async {
    Database db = await instance.database;
    List<Map> results = await db.rawQuery(
      '''
SELECT SUM(Clen)
FROM (
	SELECT COUNT(Number) as Clen, CAST(BookId as integer) as Bid
	FROM Chapter INNER JOIN Book 
	Where BookId = chapters
	GROUP BY Book.name
	ORDER By Book.chapters
) as c
WHERE Bid < $chapterNum;
      '''
    );
    return chapterNum - results.first[0];
  }

  Future<String> getBookName(int chapterNum) async {
    Database db = await instance.database;
    List<Map> results = await db.rawQuery(
      '''
SELECT DISTINCT Book.name
FROM Book JOIN Verse
WHERE Book.chapters = Verse.BookId AND Verse.ChapterId = $chapterNum;
      '''
    );

    return results.first[0];
  }

}