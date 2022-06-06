//import 'dart:ffi';

// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../components/Space.dart';
import '../components/TextEdit.dart';
import '../components/Textfixed.dart';
import '../components/components_login/logo.dart';
import '../controller/Texteditingcontroller.dart';
import '../screen/screen_main.dart';

class LayoutLogin extends StatefulWidget {
  const LayoutLogin({ Key? key }) : super(key: key);

  @override
  State<LayoutLogin> createState() => LayoutLoginState();
}

class LayoutLoginState extends State<LayoutLogin> {

   
    final double WIDTHBOXDECORATION = .85;
    final double HEIGHTBOXDECORATION= .8;
    final double DEFAULTHEIGHT = .01;
    final double DEFAULTWIDTH =.02; 
    final double DEFAULTSPACE= .2;
    final double WIDHTTEXTFIELD = .7;
    final double WIDTHBUTTON = .7;
    final double MAXSPACE= 1; 

    double? width ;
    double? height;
    bool _showPassword =  false ;

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: ((context, constraints) {
        

        return Container(
          width: responsivewidth(constraints, MAXSPACE),
          height: responsiveheight(constraints, MAXSPACE),
          color: Colors.blue,
          child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                width: responsivewidth(constraints , WIDTHBOXDECORATION),
                height: responsiveheight(constraints ,  HEIGHTBOXDECORATION),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Center(
                        child: Column(
                      children: [
                        Space(
                          height: responsivewidth(constraints , DEFAULTHEIGHT),
                        ),
                        Logo(icons: Icons.person_pin_rounded),
                        Space(height: responsivewidth(constraints , DEFAULTWIDTH),),
                        Textfixed("LOGIN"),
                      ],
                    )),
                    Space( height : responsiveheight(constraints , DEFAULTHEIGHT)),
                    Column(
                      children: [
                        SizedBox(
                        width: responsivewidth(constraints , WIDHTTEXTFIELD),
                        child: EditText(
                          controller: TextFormController.usuario,
                          cor: Colors.white,
                          label: "usuario",
                          Icons: Icons.person,
                          TextInputType: TextInputType.name,
                        ),
                      ),
                    Space( height : responsiveheight(constraints , DEFAULTHEIGHT)),
                        SizedBox(
                          width: responsivewidth(constraints , WIDHTTEXTFIELD),
                          child: edittexpassword() ,//child: edittexpassword(),
                        )
                      ],
                    ),
                   Space( height : responsiveheight(constraints , DEFAULTHEIGHT)),
                    Container(
                        width: responsivewidth(constraints , WIDTHBUTTON),
                        height: 50,
                        child: ElevatedButton(
                            child: Text("ENTRAR"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenMain()),
                              );
                            }
                            )
                            ),
                  ]),
                ),
              )),
        );
      }));
    
    
    
  }
  TextField edittexpassword() {
    return TextField(
      controller: TextFormController.senha,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      obscureText: !_showPassword,//! this
      maxLines: 1,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: "Senha ",
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() => _showPassword = !_showPassword);
            },
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            )),
      ),
    );
  }
  //Space space(BoxConstraints constraints) => Space(width: constraints.maxWidth , DEFAULTSPACE);
  double responsiveheight(BoxConstraints constraints , deafultheight) => height = constraints.maxHeight * deafultheight;
  double responsivewidth(BoxConstraints constraints,deafultwidth) => width = constraints.maxWidth * deafultwidth;
}