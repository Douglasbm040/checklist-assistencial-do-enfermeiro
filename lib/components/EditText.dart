
import 'package:flutter/material.dart';

//! herança  deve ser composição 
class EditText extends TextField {
  
 
 
  EditText({ required TextEditingController controller, 
                                required String label ,
                                required TextInputType TextInputType,
                                int? lines = 1 ,
                                var cor = Colors.black ,
                                var Icons ,
                                var IconButton,
                                //bool showPassword = false,
                               

  }) : super( controller: controller,
                            keyboardType: TextInputType,
                            maxLines: lines,
                            cursorColor: cor,
                            
                            style: TextStyle(color: cor),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons, color: cor),
                                contentPadding: EdgeInsets.all(8),
                                labelStyle: TextStyle(color: cor),
                                labelText: label,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(10)
                                        )
                                      ),
                                suffixIcon: IconButton
                                    ),

  );



    
   



}