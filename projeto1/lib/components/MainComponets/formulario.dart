// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:projeto1/components/Custom/CustomTextField.dart';
import 'package:projeto1/components/Custom/CustomDropDown.dart';
import 'package:projeto1/components/MainComponets/modalbottomshett.dart';
import 'package:projeto1/models/PacienteModel.dart';
import 'package:projeto1/repositories/RepositoriesFugulim.dart';
import '../../controller/Texteditingcontroller.dart';
import '../Custom/CustomConteiner.dart';
import '../Space.dart';

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
    var paciente;
    // ignore: constant_identifier_names
    modalBottomshett screen = modalBottomshett();
    CustomConteiner border = CustomConteiner();
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
                    child: CustomTextField(
                        controller: TextFormController.leito,
                        label: "Leito : ",
                        TextInputType: TextInputType.number,
                        Icons: Icons.bedroom_parent_sharp),
                  ),
                  Space(width: width * DEAFULTSPACE),
                  Container(
                    width: width * .5,
                    alignment: Alignment.center,
                    child: CustomTextField(
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
                  border.RadiusContainer(
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
                                  builder: (ctx) => screen.modal(ctx)),
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

                    child: CustomTextField(
                        controller: TextFormController.medico,
                        label: "Médico :",
                        TextInputType: TextInputType.name,
                        Icons: Icons.medical_services_rounded),
                  ),
                  Space(width: width * DEAFULTSPACE),
                  // border.RadiusContainer(
                  //     Width: width * .25,
                  //     height: 60,
                  //     Colors: Colors.lightBlue,
                  //     Raio: 10,
                  //     Widget: CustomDropDown(
                  //       item: "Padrão",
                  //       list: const <String>[
                  //         "Padrão",
                  //         "Contato",
                  //         "Goticulas",
                  //         "Aerossol",
                  //         "Reversa"
                  //       ],
                  //     )
                  //     ),
                ],
              ),
              Space(height: Height * DEAFULTSPACE),

              Container(
                alignment: Alignment.center,
                width: width * .9,
                child: CustomTextField(
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

                    child: CustomTextField(
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

                    child: CustomTextField(
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

                    child: CustomTextField(
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

                    child: CustomTextField(
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
                child: CustomTextField(
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
                  border.RadiusContainer(
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
                    onTap: () {
                      pacientes.add(PacienteModel(
                          TextFormController.paciente.text,
                          TextFormController.leito.text,
                          TextFormController.medico.text));
                    },
                    child: border.RadiusContainer(
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
}
