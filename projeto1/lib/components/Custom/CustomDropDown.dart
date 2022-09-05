// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List<String> list;
  var onChanged;
  Widget hint;

  //var itemselecionado;
  CustomDropDown({
    Key? key,
    //required this.itemselecionado,
    required this.list,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String dropdownValue;
  late List<String> lista = widget.list;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: widget.hint,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.black,
        size: 20,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: widget.onChanged,
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
