// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'screen_main.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ScreenConfirmation extends StatefulWidget {
  const ScreenConfirmation({Key? key}) : super(key: key);

  @override
  State<ScreenConfirmation> createState() => _ScreenConfirmationState();
}

class _ScreenConfirmationState extends State<ScreenConfirmation> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _aminationtime() async {
    Timer(
      Duration(seconds: 3),
      () {
        _btnController.success();
        sleep(Duration(seconds: 2));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScreenMain()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double wquery = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: RoundedLoadingButton(
              valueColor: Colors.blue,
              color: Colors.white,
              height: 320,
              successColor: Color.fromARGB(255, 98, 255, 103),
              child: Icon(
                Icons.save_rounded,
                color: Colors.blue,
              ),
              controller: _btnController,
              onPressed: _aminationtime,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScreenMain())),
          ),
          appBar: AppBar(
            title: Text("Confirmação !"),
          ),
          body: AnimationLimiter(
            child: ListView.builder(
                padding: EdgeInsets.all(wquery / 30),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                          verticalOffset: -250,
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 2500),
                            child: Container(
                                margin: EdgeInsets.only(bottom: wquery / 20),
                                height: wquery / 4,
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
                                                  ScreenMain())),
                                        ))),
                          )));
                }),
          )),
    );
  }
}
