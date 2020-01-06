import 'package:bible_test2/Blocs/BibleProvider/Verse.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class BibleDatabaseHelper {
  static final _databaseName = "BibleDb.db";
  static final _databaseVersion = 1;

  static final verseTable = 'Verse';
  static final verseNum = 'Number';
  static final verseText = 'Text';
  static final verseChapterId = 'ChapterId';


  // Singleton use of bible database
  BibleDatabaseHelper._privateConstructor();
  static final BibleDatabaseHelper instance = BibleDatabaseHelper._privateConstructor();

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
    var dbPath = join(dbDir, "BibleDb.db");

    await deleteDatabase(dbPath);

    ByteData data = await rootBundle.load("assets/bible/BibleDb.db");
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

}