

// ignore_for_file: camel_case_types

import 'package:projeto1/repositories/repositorio.dart';
import 'package:projeto1/database/test_sql_1.dart';

class Db_Util extends Repositor{
 
  test() {     
      print(loadpct());
  }

  delete({required nometable}) {
    DataBase.delete_table(nometable);
    
  }

  insert({required nometable , required paciente}) {
    DataBase.insert(nometable, {"paciente": paciente});
    
  }

 

}

  