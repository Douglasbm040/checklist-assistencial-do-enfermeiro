import 'package:flutter/material.dart';
import '../components/MainComponets/formulario.dart';

class Layout_main extends StatefulWidget {
  const Layout_main({Key? key}) : super(key: key);

  @override
  State<Layout_main> createState() => _Layout_mainState();
}

class _Layout_mainState extends State<Layout_main> {
  TextEditingController enfermo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wquery = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("checklist assistencial da enfermagem"),
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
              return TabBarView(children: [
                Tab(
                  child: const Text("animation"),

                  // )
                ),
                Tab(
                  child: Formulario(
                      width: constraints.maxWidth,
                      Height: constraints.maxHeight),
                ),
                Tab(
                  child: const Text("animation"),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
