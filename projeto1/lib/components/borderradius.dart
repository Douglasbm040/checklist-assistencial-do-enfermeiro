import 'package:flutter/material.dart';

class borderradius {
  Container RadiusContainer(
      {required double? Width,
      required double? height,
      required var Colors,
      required double Raio,
      required var Widget}) {
    return Container(
      width: Width,
      height: height,
      decoration: BoxDecoration(
        color: Colors,
        borderRadius: BorderRadius.all(Radius.circular(Raio)),
      ),
      child: Center(child: Widget),
    );
  }
}
