// ignore_for_file: non_constant_identifier_names

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DataBase {
  
  //! criar banco de dados
  static Future<sql.Database> database() async {
    final dbpath = await sql.getDatabasesPath(); //!criando o objs que guardo o caminho do banco
    return sql.openDatabase(path.join(dbpath, "banco.db"), //! abrindo o banco de dados 
        onCreate: (db, version) {
      return db
          .execute( //! definido a comando sql 
            '''CREATE TABLE banco (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              paciente TEXT
              
              )
            
            '''
                

            );
    },
    version:1,
    );
  }

  //! insert dados
  static Future<void> insert(String Nametable, Map<String, String> data) async { 
    final db = await DataBase.database(); //! obtendo banco de dados
    await db.insert(Nametable, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
  //! deletar a tabela
  static Future<void> delete_table(String Nametable) async{
    final db = await DataBase.database();
    await db.delete(Nametable);
  }
  //! deletar a linha 
  static Future<void> delete_data(String Nametable) async{
    final db = await DataBase.database();
    await db.rawDelete(Nametable);
  }

  //! obter dados
  static Future<List<Map<String,dynamic>>> getdata(String nametable)async{
    final db = await DataBase.database();
    return db.query(nametable);
  }
}
