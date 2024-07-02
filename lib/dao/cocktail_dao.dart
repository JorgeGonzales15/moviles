import 'package:cocktail/database/app_database.dart';
import 'package:cocktail/models/cocktail.dart';
import 'package:sqflite/sqflite.dart';


class CocktailDao {
   insert(Cocktail cocktail) async {
    Database db = await AppDatabase().openDB();
    await db.insert(AppDatabase().tableName, cocktail.toMap());
  }

  delete(Cocktail cocktail) async {
    Database db = await AppDatabase().openDB();
    await db
        .delete(AppDatabase().tableName, where: "id = ?", whereArgs: [cocktail.idDrink]);
  }

  Future<bool> isFavorite(Cocktail cocktail) async {
    Database db = await AppDatabase().openDB();
    List maps = await db
        .query(AppDatabase().tableName, where: "id = ?", whereArgs: [cocktail.idDrink]);

    return maps.isNotEmpty;
  }

  Future<List<FavoriteCocktail>>fetchAll() async {
    Database db = await AppDatabase().openDB();
    List maps = await db.query(AppDatabase().tableName);
    return maps.map((map) => FavoriteCocktail.fromMap(map)).toList();
  }
}