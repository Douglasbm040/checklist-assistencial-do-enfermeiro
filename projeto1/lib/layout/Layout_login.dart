//import 'dart:ffi';

// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto1/components/components_login/EditTextPassword.dart';
import '../components/Space.dart';
import '../components/EditText.dart';
import '../components/Textfixed.dart';
import '../components/components_login/logo.dart';
import '../controller/Texteditingcontroller.dart';
import '../screen/screen_main.dart';

class LayoutLogin extends StatefulWidget {
  double width = 0;
  double height = 0;

  LayoutLogin({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<LayoutLogin> createState() => _LayoutLoginState();
}

class _LayoutLoginState extends State<LayoutLogin> {
  final double WIDTHBOXDECORATION = .85;
  final double HEIGHTBOXDECORATION = .8;
  final double DEFAULTHEIGHT = .01;
  final double DEFAULTWIDTH = .02;
  final double DEFAULTSPACE = .2;
  final double WIDHTTEXTFIELD = .7;
  final double WIDTHBUTTON = .7;
  final double MAXSPACE = 1;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Container(
        width: widget.width * MAXSPACE,
        height: widget.height * MAXSPACE,
        color: Colors.blue,
        child: Center(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(35))),
          width: widget.width * WIDTHBOXDECORATION,
          height: widget.height * HEIGHTBOXDECORATION,
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                  child: Column(
                children: [
                  Space(
                    height: widget.width * DEFAULTHEIGHT,
                  ),
                  Logo(icons: Icons.person_pin_rounded),
                  Space(
                    height: widget.width * DEFAULTWIDTH,
                  ),
                  Textfixed("LOGIN"),
                ],
              )),
              Space(height: widget.height * DEFAULTHEIGHT),
              Column(
                children: [
                  SizedBox(
                    width: widget.width * WIDHTTEXTFIELD,
                    child: EditText(
                      controller: TextFormController.usuario,
                      cor: Colors.white,
                      label: "usuario",
                      Icons: Icons.person,
                      TextInputType: TextInputType.name,
                    ),
                  ),
                  Space(height: widget.height * DEFAULTHEIGHT),
                  SizedBox(
                      width: widget.width * WIDHTTEXTFIELD,
                      child: EditTextPassword(isshowpassword: true))
                ],
              ),
              Space(height: widget.height * DEFAULTHEIGHT),
              Container(
                  width: widget.width * WIDTHBUTTON,
                  height: 50,
                  child: ElevatedButton(
                      child: Text("ENTRAR"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenMain()),
                        );
                      })),
            ]),
          ),
        )),
      );
    }));
  }
}
