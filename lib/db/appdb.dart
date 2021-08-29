import 'package:owl_reminder/db/remindtable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDB {
  static const NAME_DB = 'app_db.db';
  static const version = 1;
  static Database? _database;

  static final AppDB instance = AppDB._init();
  AppDB._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    return await openDatabase(join(await getDatabasesPath(), NAME_DB),
        onCreate: (db, version) {
      db.execute(RemindTable.CREATE_TABLE);
    }, version: 1);
  }
}
