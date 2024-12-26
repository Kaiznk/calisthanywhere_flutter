import 'dart:async';

import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static FutureOr<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nombRout TEXT,
        serieMax INTEGER,
        serieMin INTEGER,
        descanEjerc INTEGER,
        descanSerie INTEGER,
        foto TEXT,
        tipoR TEXT
      )
      """);
  }

  static FutureOr<sql.Database> db() async {
    return sql.openDatabase(
      'routines.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static FutureOr<int> createItem(String nombRout, int serieMax, int serieMin,
      int descanEjerc, int descanSerie, String foto, String tipoR) async {
    final db = await SQLHelper.db();

    final data = {
      'nombRout': nombRout,
      'serieMax': serieMax,
      'serieMin': serieMin,
      'descanEjerc': descanEjerc,
      'descanSerie': descanSerie,
      'foto': foto,
      'tipoR': tipoR
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static FutureOr<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static FutureOr<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static FutureOr<int> updateItem(
      int id,
      String nombRout,
      int serieMax,
      int serieMin,
      int descanEjerc,
      int descanSerie,
      String foto,
      String tipoR) async {
    final db = await SQLHelper.db();

    final data = {
      'nombRout': nombRout,
      'serieMax': serieMax,
      'serieMin': serieMin,
      'descanEjerc': descanEjerc,
      'descanSerie': descanSerie,
      'foto': foto,
      'tipoR': tipoR
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static FutureOr<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
