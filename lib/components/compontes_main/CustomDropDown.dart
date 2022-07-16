import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<CustomDropDown> {
  String dropdownValue = 'Padrão';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
        size: 20,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Padrão', 'Contato', 'Goticulas', 'Aerossois', "Reversa"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
