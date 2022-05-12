import 'dart:io';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DataBase {
  static Future<List<Map<String,dynamic>>> getdata(String nometable)async{
    final db = await DataBase.database();
    return db.query(nometable);
  }
  //! criar banco de dados
  static Future<sql.Database> database() async {
    final dbpath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbpath, "banco.db"),
        onCreate: ((db, version) {
      return db
          .execute("CREATE TABLE banco (id TEXT PRIMARY KEY, paciente TEXT)");
    }));
  }

  //! insert data
  static Future<void> insert(String Nometable, Map<String, Object> data) async {
    final db = await DataBase.database();
    await db.insert(Nometable, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
}
