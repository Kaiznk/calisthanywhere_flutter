import 'dart:async';

import 'package:sqflite/sqflite.dart' as sql;

class SQLHelpExer {
  static FutureOr<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nombre TEXT,
        nivel TEXT,
        muscle TEXT,
        previos TEXT,
        ayudaA TEXT,
        descripcion TEXT,
        consejo TEXT,
        foto TEXT,
        repet INTEGER,
        idRoutine INTEGER
      )
      """);
  }

  static FutureOr<sql.Database> db() async {
    return sql.openDatabase(
      'exercises.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static FutureOr<int> createItem(
      String nombre,
      String nivel,
      String muscle,
      String previos,
      String ayudaA,
      String descripcion,
      String consejo,
      String foto,
      int repet,
      int idRoutine) async {
    final db = await SQLHelpExer.db();

    final data = {
      'nombre': nombre,
      'nivel': nivel,
      'muscle': muscle,
      'previos': previos,
      'ayudaA': ayudaA,
      'descripcion': descripcion,
      'consejo': consejo,
      'foto': foto,
      'repet': repet,
      'idRoutine': idRoutine
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static FutureOr<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelpExer.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  static FutureOr<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelpExer.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static FutureOr<int> updateItem(
      int id,
      String nombre,
      String nivel,
      String muscle,
      String previos,
      String ayudaA,
      String descripcion,
      String consejo,
      String foto,
      int repet,
      String idRoutine) async {
    final db = await SQLHelpExer.db();

    final data = {
      'nombre': nombre,
      'nivel': nivel,
      'muscle': muscle,
      'previos': previos,
      'ayudaA': ayudaA,
      'descripcion': descripcion,
      'consejo': consejo,
      'foto': foto,
      'repet': repet,
      'idRoutine': idRoutine
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static FutureOr<void> deleteItem(int id) async {
    final db = await SQLHelpExer.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }

  // Delete by idRout
  static FutureOr<void> deleteItemRout(int idR) async {
    final db = await SQLHelpExer.db();
    try {
      await db.delete("items", where: "idRoutine = ?", whereArgs: [idR]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
