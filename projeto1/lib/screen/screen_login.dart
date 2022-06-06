//import 'dart:ffi';
//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto1/layout/Layout_login.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScreenLogin());
  }
}

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutLogin(),
      ),
    );
  } 
}
