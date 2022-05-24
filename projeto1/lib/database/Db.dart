import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  //! modelo de padrao de projeto chamado singleton
  //! CONTRUTOR COM ACESSO PRIVADO
  DB._();

  //! criar uma instacia de DB
  static final DB instance = DB._();

  //! instancia do sqlite
  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), "bank.db"),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_acesso);
    await db.execute(_listpaciente);
  }

  String get _acesso => '''
    CREATE TABLE acesso(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      usuario TEXT
      senha TEXT 
          )
    ''';

  String get _listpaciente => '''
  CREATE TABLE listpaciente(
    id INTERGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    clinico TEXT,
    parecer TEXT,
    exames TEXT,
    obs TEXT,
    sae TEXT,
    
  )


  ''';
}
