import 'package:supercomicsapp/database/app_database';
import 'package:sqflite/sqlite_api.dart';
import 'package:supercomicsapp/models/superhero.dart';

class SuperheroDao {
  Future<void> insert(Superhero superhero) async {
    Database db = await AppDatabase().openDb();
    print('Inserting superhero: ${superhero.toMap()}');

    List<Map<String, dynamic>> existing = await db.query(
      AppDatabase().tableName,
      where: "id = ?",
      whereArgs: [superhero.id],
    );

    if (existing.isEmpty) {
      await db.insert(AppDatabase().tableName, superhero.toMap());
    } else {
      await db.update(
        AppDatabase().tableName,
        superhero.toMap(),
        where: "id = ?",
        whereArgs: [superhero.id],
      );
    }
  }

  Future<void> delete(Superhero superhero) async {
    Database db = await AppDatabase().openDb();
    print('Deleting superhero: ${superhero.name}');
    await db.delete(AppDatabase().tableName,
        where: "id = ?", whereArgs: [superhero.id]);
  }

  Future<bool> isFavorite(Superhero superhero) async {
    Database db = await AppDatabase().openDb();
    List<Map<String, dynamic>> maps = await db.query(
      AppDatabase().tableName,
      where: "id = ?",
      whereArgs: [superhero.id],
    );

    print('Checking if superhero is favorite: ${maps.isNotEmpty}');
    return maps.isNotEmpty;
  }

  Future<List<Superhero>> getAll() async {
    Database db = await AppDatabase().openDb();
    List<Map<String, dynamic>> maps = await db.query(AppDatabase().tableName);
    print('Fetched all superheroes: $maps');
    return maps.map((map) => Superhero.fromMap(map)).toList();
  }
}
