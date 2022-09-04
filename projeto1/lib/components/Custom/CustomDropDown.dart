import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List<String> list;
  String item;
  //var itemselecionado;
  CustomDropDown({
    Key? key,
    required this.item,
    required this.list,
    //required this.itemselecionado,
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
    dropdownValue = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
