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
            onPressed: () => Navigator.push(
                context,
                 MaterialPageRoute(
                    builder: (context) => ScreenConfirmation())),
          ),
          body: AnimationLimiter(
            child: ListView.builder(
                padding: EdgeInsets.all(widthquery / 30),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 2500),
                            child: Container(
                                margin:
                                    EdgeInsets.only(bottom: widthquery / 20),
                                height: widthquery / 4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10)
                                  ],
                                ),
                                child: ElevatedButton(
                                    child: Icon(Icons.list),
                                    onPressed: () => Navigator.push(
                                          context,
                                           MaterialPageRoute(
                                              builder: ((context) =>
                                                  ScreenConfirmation())),
                                        ))),
                          )));
                }),

            //(children: [
            //  ElevatedButton(
            //      child: Icon(Icons.list),
            //      onPressed: () => Navigator.push(
            //            context,
            //            new MaterialPageRoute(
            //                builder: ((context) => ScreenConfirmation())),
            //          ))
            //]),
          )),
    );
  }
}
