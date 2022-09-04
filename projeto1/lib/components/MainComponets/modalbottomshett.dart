import 'package:flutter/material.dart';
import 'package:projeto1/components/Custom/CustomDropDown.dart';
import 'package:projeto1/components/Space.dart';
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
      child: ListView.builder(
          itemCount: escala.fugulim.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, int index) {
            return ListTile(
              leading: Text(escala.fugulim.keys.toList()[index] + " :"),
              title: CustomDropDown(
                  item: escala.fugulim.values.toList()[index][0],
                  //itemselecionado: () {},
                  list: escala.fugulim.values.toList()[index]),
              onTap: () {
                print("");
              },
            );
          }),
    );
  }
}
