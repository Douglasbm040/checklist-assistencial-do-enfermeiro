import 'package:flutter/material.dart';
import 'package:projeto1/models/PacienteModel.dart';

class listpacient extends StatelessWidget {
  final double? wquery;
  final Widget widget = const Text("paciente");

  const listpacient({
    @required Widget? widget,
    Key? key,
    this.wquery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(wquery! / 30),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: pacientes.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: ListTile(
            title: Text(pacientes[index].nome),
            subtitle: Text(pacientes[index].medico),
            trailing: Text(pacientes[index].leito),
          ));
        });
  }
}
