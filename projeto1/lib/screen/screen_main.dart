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

              //(children: [
              //  ElevatedButton(
              //      child: Icon(Icons.list),
              //      onPressed: () => Navigator.push(
              //            context,
              //            new MaterialPageRoute(
              //                builder: ((context) => ScreenConfirmation())),
              //          ))
              //]),
            )),
            //    child: ElevatedButton(
            //  child: Icon(Icons.list),
            //  onPressed: () => Navigator.pop(context),
            //)
            //!child: ListView(
            //!  children: [
            //!    Text("ola"),
            //!    RaisedButton(
            //!      child: Icon(Icons.list),
            //!      onPressed: () => Navigator.pop(context),
            //!    )
            //!  ],
            //!),
            //),
            Tab(
              child: SingleChildScrollView(
                child: Form(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: ListView(
                      padding: const EdgeInsets.all(25),
                      children: [
                        //
                        Row(
                          children: [
                            Container(
                              width: 140,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "LEITO",
                                  prefixIcon: const Icon(
                                    Icons.bedroom_parent_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 550,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Paciente :",
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        Row(
                          children: [
                            Container(
                              width: 750,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text(
                                    "Classificação de cuidados : [ ] intensivos [ ] semi- intesivos [ ] intermediarios [ ] minimos"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 470,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Médico :",
                                  prefixIcon: const Icon(
                                    Icons.medical_services_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            

                              Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text(
                                    "PRECAUÇÃO"),
                              ),
                            )
                            
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                         TextField(
                                keyboardType: TextInputType.multiline,
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Quadro clinico :",
                                  prefixIcon: const Icon(
                                    Icons.health_and_safety,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                         SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 300,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Dieta :",
                                  prefixIcon: const Icon(
                                    Icons.food_bank_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80 ,
                            ),
                            Container(
                              width: 300,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Diurese :",
                                  prefixIcon: const Icon(
                                    Icons.water_drop,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 200,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Acesso venoso :",
                                  prefixIcon: const Icon(
                                    Icons.bloodtype,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 520,

                              alignment: Alignment.center,
                              //padding: const EdgeInsets.all(25),

                              child: TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelText: "Curativos :",
                                  prefixIcon: const Icon(
                                    Icons.home_repair_service_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),

                  // child: Column(
                  //
                  //   children: [
                  //     Text(
                  //       "Cadastro de paciente",
                  //       style: TextStyle(
                  //           fontSize: 50,
                  //           fontWeight: FontWeight.w400,
                  //
                  //           ),
                  //     ),
                  //
                  //     Text(texto.toString()),
                  //     //Text("nome do medico : "),
                  //     //Text("patologia: "),
                  //     //Text("numero do leito : "),
                  //     //Text("pendencias: "),
                  //     //Text("exames: "),
                  //
                  //     TextField(
                  //       controller: enfermo,
                  //       cursorColor: Colors.black,
                  //       style: TextStyle(color: Colors.black),
                  //       decoration: InputDecoration(
                  //           contentPadding: EdgeInsets.all(8),
                  //           labelStyle: TextStyle(color: Colors.black),
                  //           labelText: "paciente",
                  //           border: const OutlineInputBorder(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(10)))),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         ElevatedButton(
                  //             child: Icon(Icons.delete),
                  //             onPressed: () => apagar()),
                  //         ElevatedButton(
                  //             child: Icon(Icons.list),
                  //             onPressed: () => atualizar()),
                  //       ],
                  //     )
                  //   ],
                  // ),
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

              //(children: [
              //  ElevatedButton(
              //      child: Icon(Icons.list),
              //      onPressed: () => Navigator.push(
              //            context,
              //            new MaterialPageRoute(
              //                builder: ((context) => ScreenConfirmation())),
              //          ))
              //]),
            )),
          ]),
        ),
      ),
    );
  }
}
