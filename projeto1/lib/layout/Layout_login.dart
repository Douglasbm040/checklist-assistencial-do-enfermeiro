//import 'dart:ffi';

// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto1/components/LoginComponets/TextFieldLogin.dart';
import '../components/Custom/CustomTextField.dart';
import '../components/Space.dart';
import '../components/Custom/CustomText.dart';
import '../components/LoginComponets/logo.dart';
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

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Container(
        width: widget.width * MAXSPACE,
        height: widget.height * MAXSPACE,
        color: Colors.blue,
        child: Center(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 350,
          ),
          child: Container(
            height: widget.height * HEIGHTBOXDECORATION,
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(35))),
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
                    CustomText("LOGIN"),
                  ],
                )),
                Space(height: widget.height * DEFAULTHEIGHT),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: widget.width * WIDHTTEXTFIELD,
                        child: CustomTextField(
                          controller: TextFormController.usuario,
                          cor: Colors.white,
                          label: "Usuario",
                          Icons: Icons.person,
                          TextInputType: TextInputType.name,
                        ),
                      ),
                    ),
                    Space(height: widget.height * DEFAULTHEIGHT),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          width: widget.width * WIDHTTEXTFIELD,
                          child: EditTextPassword(isshowpassword: false)),
                    )
                  ],
                ),
                Space(height: widget.height * DEFAULTHEIGHT),
                ElevatedButton(
                    child: Text("ENTRAR"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScreenMain()),
                      );
                    }),
              ]),
            ),
          ),
        )),
      );
    }));
  }
}
