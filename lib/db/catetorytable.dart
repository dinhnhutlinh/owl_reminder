import 'package:owl_reminder/db/appdb.dart';

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

  Future<List<String>> getAllCategory() async {
    final db = await AppDB.instance.database;
    List<Map<String, Object?>> data = await db.query(NAME);
    return data.map((e) => e[CATEGORY] as String).toList();
  }
}
