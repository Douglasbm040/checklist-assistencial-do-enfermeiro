import 'package:projeto1/database/date_local.dart';
import 'package:projeto1/models/models_paciente.dart';

class REPOSITOR {
  List <Paciente> pcts = [] ;
  String? nome ;
  Future loadpct () async{
    final datalist = await DataBase.getdata("banco");
    nome = datalist.toString();
    
    //Paciente(paciente: datalist[1][1]);
    

    
  }
}