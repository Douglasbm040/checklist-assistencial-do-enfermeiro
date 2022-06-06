import 'package:projeto1/database/test_sql_1.dart';


class Repositor {
  String? nome ;
  Future loadpct () async{
    final datalist = await DataBase.getdata("banco");
    nome = datalist.toString();
    return nome ;
    
    
    

    
  }
}