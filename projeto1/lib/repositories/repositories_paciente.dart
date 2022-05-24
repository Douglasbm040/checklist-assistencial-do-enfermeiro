import 'package:flutter/cupertino.dart';
import 'package:projeto1/database/Db.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:projeto1/database/date_local.dart';
import '../models/models_paciente.dart';

class PacienteRepository extends ChangeNotifier {
  late Database db; // recuperar a instacia do banco
  List<Paciente> _listpaciente = [];
  String? PCT ;

  List<Paciente> get listpaciente => _listpaciente;

  PacienteRepository() {
    initRepository();
  }

  initRepository() async {
    await getListpaciente;
  }

  getListpaciente() async {
    db = await DB.instance.database;
    List pct = await db.query("listpaciente");
    notifyListeners();
  }

  setpaciente(String nome) async {
    db = await DB.instance.database;
    db.update("listpaciente",{
      "nome" : nome 
    });
    PCT = nome ;
    notifyListeners();
  }
}
