import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = "cocktails3.db";
  final String tableName = "cocktails3";

  Database? _db;

  Future<Database> openDB() async {
    _db ??= await openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (db, version) {
      String query =
          "create table $tableName (id text primary key, name text)";
      db.execute(query);
    }, version: version);
    return _db as Database;
  }
}