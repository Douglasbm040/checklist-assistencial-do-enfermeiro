// ignore_for_file: prefer_const_constructors
//import 'dart:html';
//import 'dart:js';
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
  apagar() {
    setState(() {
      DataBase.delete_table("banco");
      
    });
  }

  atualizar() {
    setState(() {
      DataBase.insert("banco", {"paciente": enfermo.text});
      repor.loadpct();
      texto = repor.nome;
      print(texto);
    });
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
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.qr_code_scanner_rounded),
              ),
              Tab(
                icon: Icon(Icons.medical_services),
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
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Column(
                    children: [
                      Text(texto.toString()),
                      //Text("nome do medico : "),
                      //Text("patologia: "),
                      //Text("numero do leito : "),
                      //Text("pendencias: "),
                      //Text("exames: "),

                      TextField(
                        controller: enfermo,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: "paciente",
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              child: Icon(Icons.delete),
                              onPressed: () => apagar()),
                          ElevatedButton(
                              child: Icon(Icons.list),
                              onPressed: () => atualizar()),
                        ],
                      )
                    ],
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
