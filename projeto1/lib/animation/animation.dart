import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:projeto1/components/compontes_main/form.dart';

import '../screen/screen_sae.dart';
class Animationwidget extends StatelessWidget {
  final double? wquery ; 
  final Widget widget = const Text("diget");
  
  const Animationwidget({
    @ required Widget? widget ,
    Key? key,
    this.wquery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
              child: ListView.builder(
                  padding: EdgeInsets.all(wquery! / 30),
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: Duration(milliseconds: 100),
                        child: SlideAnimation(
                            horizontalOffset: -300,
                            verticalOffset: -850,
                            duration: Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: Duration(milliseconds: 2500),
                              child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: wquery! / 20),
                                  height: wquery! / 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black.withOpacity(0.1),
                                          blurRadius: 40,
                                          spreadRadius: 10)
                                    ],
                                  ),
                                  child: widget ),//Column(
                                  //!  children: [
                                  //!    ElevatedButton(
                                  //!        child: Icon(Icons.list),
                                  //!        onPressed: () => Navigator.push(
                                  //!              context,
                                  //!               MaterialPageRoute(
                                  //!                  builder: ((context) =>
                                  //!                      ScreenSAE())),
                                  //!            ))
                                  //!  ],
                                  //!)),
                            )));
                  }),
            );
  }
}
