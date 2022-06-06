import 'package:flutter/material.dart';
class Textfixed extends Text {
  Textfixed(String data , 
          { double size = 50 ,
            var Colors = Colors.white,
          
          
          } 
            ) : super(
              data ,
               style: TextStyle(
                              color: Colors,
                              fontSize: size,
                              fontWeight: FontWeight.w400)
              );
  


}