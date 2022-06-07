
import 'package:flutter/material.dart';

//! herança  deve ser composição 
class EditText extends StatelessWidget{
  final TextEditingController controller;
  final TextInputType inputtype;
  final double ? width;
  final int? lines ;
  bool obscureText;
  final IconData icons;
  final String label;
  final IconButton? button;
  var cor;
  


  
 
 
 EditText({ required TextEditingController this.controller,
                                double? this.width, 
                                required String this.label ,
                                required this.icons,
                                required TextInputType this.inputtype,
                                int? this.lines = 1  ,
                                this.cor = Colors.black ,
                                var Icons ,
                                this.button,
                                bool this.obscureText = false ,    
                               

  }) : super();

  @override
  Widget build( BuildContext context ) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
                            keyboardType: inputtype,
                            maxLines: lines,
                            cursorColor: Colors.black,
                            obscureText: obscureText ,
                            style: TextStyle(color: cor),
                            decoration: InputDecoration(
                                prefixIcon: Icon(icons, color: cor),
                                contentPadding: EdgeInsets.all(8),
                                labelStyle: TextStyle(color: cor),
                                labelText: label,
                                suffixIcon: button,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(10)
                                        )
                                      ),
                                
      )
      )
    );
  }



    
   



}