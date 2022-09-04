//import 'dart:js';
// ignore_for_file: prefer_const_constructors
import 'screen_confimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ScreenSAE extends StatelessWidget {
  const ScreenSAE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthquery = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("cadastro SAE"),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_circle_right_sharp),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScreenConfirmation())),
          ),
          body: ListView.builder(
              padding: EdgeInsets.all(widthquery / 30),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                    child: Icon(Icons.list),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ScreenConfirmation())),
                        ));
              })),
    );
  }
}
