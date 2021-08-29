import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:owl_reminder/db/appdb.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:sqflite/sqflite.dart';

class RemindTable {
  static const NAME = 'Remind';
  static const ID = 'id';
  static const TITLE = 'title';
  static const CATEGORY = 'category';
  static const NOTE = 'note';
  static const TIMETASK = 'timetask';
  static const LOCATION = 'location';
  static const TIMEBEFORE = 'timebefore';
  static const REPEAT = 'repeat';
  static const COMPLETE = 'complete';
  static const COLOR = 'color';

  static const CREATE_TABLE = """
  CREATE TABLE $NAME(
    $ID INTEGER PRIMARY KEY, $TITLE TEXT, $CATEGORY TEXT,
  $NOTE TEXT, $TIMETASK TEXT, $LOCATION TEXT,$TIMEBEFORE INTEGER,
  $REPEAT INTEGER,$COMPLETE INTEGER,$COLOR TEXT);
  """;

  Future<int> add(Remind remind) async {
    final db = await AppDB.instance.database;
    return db.insert(NAME, remind.toJSon(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(Remind remind) async {
    final db = await AppDB.instance.database;
    return await db.update(NAME, remind.toJSon(),
        where: 'id=?',
        whereArgs: [remind.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(int id) async {
    final db = await AppDB.instance.database;
    return await db.delete(NAME, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Remind>> getRemindInSelectDay(DateTime selectedDay) async {
    String query = '''
     SELECT * FROM $NAME WHERE $TIMETASK = ${DateFormat('yyyy-MM-dd').format(selectedDay)}
     ''';
    final db = await AppDB.instance.database;

    final data = await db.rawQuery(query);
    List<Remind> result = [];
    data.forEach((json) {
      result.add(Remind.formJSon(json));
    });

    return result;
  }

  Future<List<DateTime>> getDaysHaveRemind() async {
    String query = '''
    SELECT $TIMETASK FORM $NAME WHERE $TIMETASK > SELECT datetime('now')
    ''';
    final db = await AppDB.instance.database;
    List<Map<String, dynamic>> data = await db.rawQuery(query);
    List<DateTime> result = [];
    data.forEach((element) => DateTime.parse(element[TIMETASK]));
    return result;
  }
}
