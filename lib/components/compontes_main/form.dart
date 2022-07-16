// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:projeto1/components/compontes_main/CustomDropDown.dart';
import '../../controller/Texteditingcontroller.dart';
import '../Space.dart';
import '../EditText.dart';

class Formulario extends StatelessWidget {
  final double width;
  final double Height;

  Formulario({
    Key? key,
    this.width = 0,
    this.Height = 0,
  }) : super(
          key: key,
        );

  final GlobalKey<ScaffoldState> _scafoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names
    const double DEAFULTSPACE = .03;
    return Scaffold(
      key: this._scafoldkey,
      body: Form(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: Height,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            children: [
              //
              Row(
                children: [
                  Container(
                    width: width * .2,
                    alignment: Alignment.center,
                    child: EditText(
                        controller: TextFormController.leito,
                        label: "Leito : ",
                        TextInputType: TextInputType.number,
                        Icons: Icons.bedroom_parent_sharp),
                  ),
                  Space(width: width * DEAFULTSPACE),
                  Container(
                    width: width * .5,
                    alignment: Alignment.center,
                    child: EditText(
                        controller: TextFormController.paciente,
                        label: "Paciente :",
                        TextInputType: TextInputType.name,
                        Icons: Icons.person),
                  ),
                ],
              ),
              Space(height: Height * .03),
              Row(
                children: [
                  RadiusContainer(
                    Width: width * .79,
                    height: width * .07,
                    Colors: Colors.lightBlue,
                    Raio: 10,
                    Widget: Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Space(width: 10),
                          ElevatedButton(
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) => _buildershwtt(ctx)),
                              child: const Text("classificação de pacientes")),
                          Space(width: 10),
                          Space(width: 10),
                          Text("cuidados... ",
                              style: TextStyle(color: Colors.white))
                        ]),
                  ),
                ],
              ),

              Space(height: Height * DEAFULTSPACE),
              Row(
                children: [
                  Container(
                    width: width * .5,

                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(25),

                    child: EditText(
                        controller: TextFormController.medico,
                        label: "Médico :",
                        TextInputType: TextInputType.name,
                        Icons: Icons.medical_services_rounded),
                  ),
                  Space(width: width * DEAFULTSPACE),
                  RadiusContainer(
                      Width: width * .25,
                      height: 60,
                      Colors: Colors.lightBlue,
                      Raio: 10,
                      Widget: CustomDropDown()),
                ],
              ),
              Space(height: Height * DEAFULTSPACE),

              Container(
                alignment: Alignment.center,
                width: width * .9,
                child: EditText(
                    controller: TextFormController.qclinico,
                    label: "Quadro Clinico :",
                    TextInputType: TextInputType.name,
                    Icons: Icons.health_and_safety),
              ),

              Space(height: Height * DEAFULTSPACE),
              Row(
                children: [
                  Container(
                    width: width * .4,

                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(25),

                    child: EditText(
                        controller: TextFormController.dieta,
                        label: "Dieta :",
                        TextInputType: TextInputType.name,
                        Icons: Icons.food_bank_rounded),
                  ),
                  Space(
                    width: width * DEAFULTSPACE,
                  ),
                  Container(
                    width: width * .4,

                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(25),

                    child: EditText(
                        controller: TextFormController.diurese,
                        label: "Diurese :",
                        TextInputType: TextInputType.name,
                        Icons: Icons.water_drop),
                  ),
                ],
              ),
              Space(height: Height * DEAFULTSPACE),
              Row(
                children: [
                  Container(
                    width: width * .32,

                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(25),

                    child: EditText(
                        controller: TextFormController.acesso,
                        label: "Acesso venoso :",
                        TextInputType: TextInputType.name,
                        Icons: Icons.bloodtype),
                  ),
                  Space(width: width * DEAFULTSPACE),
                  Container(
                    width: width * .5,

                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(25),

                    child: EditText(
                        controller: TextFormController.curativo,
                        label: "Curativos :",
                        lines: 2,
                        TextInputType: TextInputType.multiline,
                        Icons: Icons.home_repair_service_rounded),
                  ),
                ],
              ),
              Space(height: Height * DEAFULTSPACE),
              Container(
                child: EditText(
                  label: "Obs .:",
                  controller: TextFormController.obs,
                  TextInputType: TextInputType.multiline,
                  Icons: Icons.health_and_safety,
                  lines: 5,
                ),
              ),

              Space(height: Height * DEAFULTSPACE),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadiusContainer(
                      Width: width * .4,
                      height: Height * .065,
                      Colors: Colors.blue,
                      Raio: 45,
                      Widget: Text(
                        "Limpar ",
                        style: TextStyle(color: Colors.white),
                      )),
                  Space(width: width * DEAFULTSPACE),
                  GestureDetector(
                    onTap: () {},
                    child: RadiusContainer(
                        Width: width * .4,
                        height: Height * .065,
                        Colors: Colors.blue,
                        Raio: 45,
                        Widget: Text(
                          "Salvar ",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildershwtt(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 4),
        // borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView(
          children: [
            Center(
                child: Column(
              children: [
                const Text("classificação do paciente :"),
              ],
            )),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Estado Mental",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Oxigenação",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Sinais vitais",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Motilidade",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Deambulação",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Alimentação",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Cuidados corporais",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Eliminação",
                TextInputType: TextInputType.text),
            Space(height: 10),
            EditText(
                controller: TextFormController.acesso,
                label: "Terapeutica",
                TextInputType: TextInputType.text),
            Space(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Salvar"))
          ],
        ),
      ),
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
}
