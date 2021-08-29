import 'package:owl_reminder/db/appdb.dart';
import 'package:sqflite/sqflite.dart';

class CategoryTable {
  static const NAME = 'CategoryTable';
  static const CATEGORY = 'category';
  static const CREATE_TABLE = '''
  CREATE TABLE $NAME ($CATEGORY TEXT PRIMARY KEY)
  ''';
  Future<void> addCategory(String category) async {
    final db = await AppDB.instance.database;
    db.insert(NAME, {CATEGORY: category});
  }
}
