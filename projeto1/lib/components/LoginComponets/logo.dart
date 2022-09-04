import 'package:flutter/material.dart';
class Logo extends Container {
  Logo({Key? key,  double height = 150,
                       double width = 150,
                       double size = 90 ,
                        required IconData icons,


  }): super(key: key,  height: height,
            width: width,
            child: Icon(
            icons,
            color: Colors.white,
            size: size ),
            decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
      );
  
}