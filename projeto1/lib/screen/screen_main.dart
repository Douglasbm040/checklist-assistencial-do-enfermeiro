// ignore_for_file: prefer_const_constructors
//import 'dart:html';
//import 'dart:js';

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:projeto1/database/date_local.dart';
import 'package:projeto1/repositories/repositorio.dart';
import 'package:flutter/material.dart';
import 'package:projeto1/screen/screen_sae.dart';
import 'screen_sae.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

///import 'package:qr_code_scanner/qr_code_scanner.dart';

main() => runApp(ScreenMain());

class ScreenMain extends StatefulWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {

  static const Map<String,List<String>> menu =  {
    "classificao": ["INTENSIVO", "SEMI-INTENSIVO","INTERMEDIARIO", "MINIMOS"],
    "precaucao" : ["PADRÃO, CONTATO , GOTICULAS, AEROSOL ,REVERSA"],
    "dieta" : ["ORAL", "SNE" , "GTT"],
    "diurese": ["ESPONTANEA", "SVD" , "CISTOSTOMIA"],
};

  


  TextEditingController enfermo = TextEditingController();
  REPOSITOR repor = REPOSITOR();
  String? texto;

  carregartext() {
    setState(() {
      repor.loadpct();
      texto = repor.nome;
    });
  }

  apagar() {
    DataBase.delete_table("banco");
    carregartext();
  }

  atualizar() {
    DataBase.insert("banco", {"paciente": enfermo.text});
    carregartext();
  }

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
          body: TabBarView(children: [
            Tab(
                child: AnimationLimiter(
              child: ListView.builder(
                  padding: EdgeInsets.all(wquery / 30),
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: Duration(milliseconds: 100),
                        child: SlideAnimation(
                            horizontalOffset: -300,
                            verticalOffset: -850,
                            duration: Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: Duration(milliseconds: 2500),
                              child: Container(
                                  margin: EdgeInsets.only(bottom: wquery / 20),
                                  height: wquery / 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 40,
                                          spreadRadius: 10)
                                    ],
                                  ),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Icon(
                                        Icons.list,
                                        size: 50,
                                      ),
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenSAE())),
                                    ),
                                  )),
                            )));
                  }),
            )),
            Tab(
              child: SingleChildScrollView(
                child: Form(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        //
                        Row(
                          children: [
                            Container(
                              width: 140,
                              alignment: Alignment.center,
                              child: textformfield(
                                  Text: "Leito : ",
                                  TextInputType: TextInputType.number,
                                  Icons: Icons.bedroom_parent_sharp),
                            ),
                            space(height: 0, width: 25),
                            Container(
                              width: 550,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: textformfield(
                                  Text: "Paciente :",
                                  TextInputType: TextInputType.name,
                                  Icons: Icons.person),
                            ),
                          ],
                        ),
                        space(width: 60),

                        Row(
                          children: [
                            RadiusContainer(
                              Width: 750,
                              height: 50,
                              Colors: Colors.lightBlue,
                              Raio: 10,
                              Widget: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Classificação de cuidados : [ ] intensivos [ ] semi- intesivos [ ] intermediarios [ ] minimos"),
                                      DropdownButton(items: menu["classificao"], onChanged: (String? newvalue){
                                        if (newvalue != null) {
                                          setState(() {
                                            
                                          });
                                          
                                        }
                                      }),
                                  
                                  ],
                                ),
                              
                            ),
                          ],
                        ),
                        space(),
                        Row(
                          children: [
                            Container(
                              width: 470,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: textformfield(
                                  Text: "Médico :",
                                  TextInputType: TextInputType.name,
                                  Icons: Icons.medical_services_rounded),
                            ),
                            space(width: 30),
                            RadiusContainer(
                                Width: 200,
                                height: 60,
                                Colors: Colors.lightBlue,
                                Raio: 10,
                                Widget: Text("PRECAUÇÃO")),
                          ],
                        ),
                        space(),

                        textformfield(
                            Text: "Quadro Clinico :",
                            TextInputType: TextInputType.name,
                            Icons: Icons.health_and_safety),

                        space(),
                        Row(
                          children: [
                            Container(
                              width: 300,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: textformfield(
                                  Text: "Dieta :",
                                  TextInputType: TextInputType.name,
                                  Icons: Icons.food_bank_rounded),
                            ),
                            space(
                              width: 80,
                            ),
                            Container(
                              width: 300,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: textformfield(
                                  Text: "Diurese :",
                                  TextInputType: TextInputType.name,
                                  Icons: Icons.water_drop),
                            ),
                          ],
                        ),
                        space(),
                        Row(
                          children: [
                            Container(
                              width: 200,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: textformfield(
                                  Text: "Acesso venoso :",
                                  TextInputType: TextInputType.name,
                                  Icons: Icons.bloodtype),
                            ),
                            space(
                              width: 20,
                            ),
                            Container(
                              width: 520,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: textformfield(
                                  Text: "Curativos :",
                                  TextInputType: TextInputType.name,
                                  Icons: Icons.home_repair_service_rounded),
                            ),
                          ],
                        ),
                        space(),
                        textformfield(
                            Text: "Quadro Clinico :",
                            TextInputType: TextInputType.multiline,
                            Icons: Icons.health_and_safety),
                        space(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadiusContainer(
                                Width: 250,
                                height: 50,
                                Colors: Colors.blue,
                                Raio: 45,
                                Widget: Text(
                                  "Limpar ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            space(width: 50),
                            RadiusContainer(
                                Width: 250,
                                height: 50,
                                Colors: Colors.blue,
                                Raio: 45,
                                Widget: Text(
                                  "Salvar ",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Tab(
                child: AnimationLimiter(
              child: ListView.builder(
                  padding: EdgeInsets.all(wquery / 30),
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: Duration(milliseconds: 100),
                        child: SlideAnimation(
                            horizontalOffset: -300,
                            verticalOffset: -850,
                            duration: Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: Duration(milliseconds: 2500),
                              child: Container(
                                  margin: EdgeInsets.only(bottom: wquery / 20),
                                  height: wquery / 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 40,
                                          spreadRadius: 10)
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                          child: Icon(Icons.list),
                                          onPressed: () => Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: ((context) =>
                                                        ScreenSAE())),
                                              ))
                                    ],
                                  )),
                            )));
                  }),
            )),
          ]),
        ),
      ),
    );
  }

  SizedBox space({double width = 0, double height = 50}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

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

  TextField textformfield(
      {required String? Text, required var TextInputType, required var Icons}) {
    return TextField(
      keyboardType: TextInputType,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      textInputAction: TextInputAction.next,
      maxLines: 1,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: Text,
        prefixIcon: Icon(
          Icons,
          color: Colors.black,
        ),
      ),
    );
  }
}
