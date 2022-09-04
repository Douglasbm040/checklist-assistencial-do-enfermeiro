import 'package:flutter/material.dart';
import '../../controller/Texteditingcontroller.dart';

class EditTextPassword extends StatefulWidget {
  bool isshowpassword = false;
  EditTextPassword({Key? key, required isshowpassword}) : super(key: key);

  @override
  State<EditTextPassword> createState() => _EditTextPasswordState();
}

class _EditTextPasswordState extends State<EditTextPassword> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextFormController.senha,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      obscureText: !widget.isshowpassword, //! this
      maxLines: 1,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: "Senha ",
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() => widget.isshowpassword = !widget.isshowpassword);
            },
            icon: Icon(
              widget.isshowpassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            )),
      ),
    );
  }
}
