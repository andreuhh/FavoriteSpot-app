// file for interactions with database

import 'package:sqflite/sqflite.dart'
    as sql; // permette di utilizzare i metodi di accesso al db
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    // create path for db, at first time run onCreate funtion
    final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);

    await sqlDb.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm
          .replace, // if find 2 file with the same name, replace the oldest with the new one
    );
  }
}
