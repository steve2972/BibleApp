import 'package:bible_test2/UI/Models/Profile/VitalityGroup/GroupModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GroupDatabase {
  String path;

  GroupDatabase._();

  static final GroupDatabase db = GroupDatabase._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await init();
    return _database;
  }

  init() async {
    String path = await getDatabasesPath();
    path = join(path, 'groups.db');
    print("Entered path $path");

    return await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
            CREATE TABLE Group (_id INTEGER PRIMARY KEY, title TEXT, people TEXT, date TEXT, meetings TEXT, isPinned INTEGER)
          '''
        );
        print('New table created at $path');
      });
  }

  Future<List<GroupModel>> getGroupsFromDB() async {
    final db = await database;
    List<GroupModel> groupsList = [];
    List<Map> maps = await db.query('Group', columns: ['_id', 'title', 'people', 'date', 'meetings', 'isPinned']);

    if (maps.length > 0) {
      maps.forEach((map) {
        groupsList.add(GroupModel.fromMap(map));
      });
    }
    return groupsList;
  }

  updateGroupInDB(GroupModel updatedGroup) async {
    final db = await database;
    await db.update('Group', updatedGroup.toMap(),
        where: '_id = ?', whereArgs: [updatedGroup.id]);
    print('Group updated: ${updatedGroup.title} ${updatedGroup.people}');
  }

  deleteGroupInDB(GroupModel groupToDelete) async {
    final db = await database;
    await db.delete('Group', where: '_id = ?', whereArgs: [groupToDelete.id]);
    print('Group deleted');
  }

  Future<GroupModel> addGroupInDB(GroupModel newGroup) async {
    final db = await database;
    if (newGroup.title.trim().isEmpty) newGroup.title = 'Untitled Group';
    int id = await db.transaction((transaction){
      transaction.rawInsert(
          'INSERT into Group(title, people, date, isImportant) VALUES ("${newGroup.title}", "${newGroup.people}", ${newGroup.isPinned == true ? 1 : 0});');
    });
    newGroup.id = id;
    print('Group added: ${newGroup.title} ${newGroup.people}');
    return newGroup;
  }
}