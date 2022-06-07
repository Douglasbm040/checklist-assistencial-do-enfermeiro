import 'package:flutter/material.dart';
import 'package:projeto1/layout/Layout_login.dart';


class Space extends StatelessWidget  {
  
  final double? width ;
  final double? height;

  const Space({
              Key? key ,
              this.width ,
              this.height,
             }) : super(
                        key: key ,
                        
                        );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
      );
    
  }
}

