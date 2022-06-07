import 'dart:ffi';
import 'package:flutter/material.dart';

import '../../controller/Texteditingcontroller.dart';
import '../EditText.dart';

class VisibilityPassword extends IconButton {
  VisibilityPassword(
      { bool hidepassword = false ,
        required VoidCallback? onPressed,})
      : super(
            onPressed: onPressed,
            icon: Icon(
              hidepassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ));
}
