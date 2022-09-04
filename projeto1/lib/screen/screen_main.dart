import 'package:projeto1/components/listpacient.dart';
import 'package:projeto1/repositories/repositorio.dart';
import 'package:flutter/material.dart';

import '../components/MainComponets/formulario.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    double wquery = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("checklist assistencial da enfermagem"),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Lista de Pacientes"),
              ),
              Tab(
                child: Text("Adimissão de Pacientes"),
              ),
              Tab(
                child: Text("SAE Concluidas"),
              )
            ]),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              //double width = constraints.maxWidth;
              return TabBarView(children: [
                Tab(
                    child: listpacient(
                  wquery: wquery,
                )),
                Tab(
                  child: Formulario(
                      width: constraints.maxWidth,
                      Height: constraints.maxHeight),
                ),
                Tab(
                    child: listpacient(
                  wquery: wquery,
                )),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
