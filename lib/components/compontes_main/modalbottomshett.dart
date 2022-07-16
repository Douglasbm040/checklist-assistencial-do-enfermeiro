import 'package:flutter/material.dart';
import 'package:projeto1/components/Space.dart';
import 'package:projeto1/components/compontes_main/CustomDropDown.dart';
import 'package:projeto1/repositories/RepositoriesFugulim.dart';

class modalBottomshett {
  Container modal(BuildContext context) {
    ReporsitoriesFugulim? escala = ReporsitoriesFugulim();
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
            Row(
              children: [
                const Text("Estado Mental : "),
                CustomDropDown(
                    item: "Orientação no tempo e no espaço",
                    list: escala.fugulim["Estado Mental"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("Oxigenação : "),
                CustomDropDown(
                    item: "Não depende de oxigênio",
                    list: escala.fugulim["oxigenaçao"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("sinais vitais : "),
                CustomDropDown(
                    item: "Controle de rotina(8 horas)",
                    list: escala.fugulim["sinais vitais"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("motilidade : "),
                CustomDropDown(
                    item: "Movimenta todos os segmentos corporais",
                    list: escala.fugulim["motilidade"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("deambulação : "),
                CustomDropDown(
                    item: "Ambulante", list: escala.fugulim["deambulação"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("alimentação : "),
                CustomDropDown(
                    item: "Auto suficiente",
                    list: escala.fugulim["alimentação"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("cuidados corporais : "),
                CustomDropDown(
                    item: "Auto suficiente",
                    list: escala.fugulim["cuidados corporais"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("Eliminação : "),
                CustomDropDown(
                    item: "Auto suficiente",
                    list: escala.fugulim["Eliminação"]!)
              ],
            ),
            Space(height: 10),
            Row(
              children: [
                const Text("Terapeutica : "),
                CustomDropDown(
                    item: "I.M. ou V.O.", list: escala.fugulim["Terapeutica"]!)
              ],
            ),
            Space(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
