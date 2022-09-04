import 'package:flutter/material.dart';

class VisibilityPassword extends IconButton {
  VisibilityPassword({
    bool hidepassword = false,
    required VoidCallback? onPressed,
  }) : super(
            onPressed: onPressed,
            icon: Icon(
              hidepassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ));
}
