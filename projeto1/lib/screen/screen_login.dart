//import 'dart:ffi';
//ignore_for_file: prefer_const_constructors
import 'package:projeto1/repositories/repositorio.dart';
import 'package:projeto1/database/date_local.dart';
import 'package:flutter/material.dart';
import './screen_main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScreenLogin());
  }
}

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  //! void _nextview(BuildContext context) {
  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  REPOSITOR rps = REPOSITOR();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(builder: ((context, constraints) {
          return Container(
            color: Colors.blue,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              width: constraints.maxWidth * 0.85,
              height: constraints.maxHeight * 0.8,
              child: SingleChildScrollView(
                child: Column(
                    
                    children: [
                      
                        Center(
                            child: Column(
                          children: [
                            Container(
                              height: constraints.maxWidth*.13,
                            ),
                            Container(
                              height: 150,
                              width: 150,
                              child: Icon(
                                Icons.assignment_ind_rounded,
                                color: Colors.white,
                                size: 90,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                            ),
                            SizedBox(
                          height: constraints.maxHeight * .03,
                        ),
                            Text("LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w400
                                    )
                                    ),
                          ],
                        )),
                        SizedBox(
                          height: constraints.maxHeight * .03,
                        ),
                      

                      Column(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .8,
                            child: TextField(
                              controller: usuario,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person, color: Colors.white,),
                                  contentPadding: EdgeInsets.all(8),
                                  labelStyle: TextStyle(color: Colors.white),
                                  labelText: "Usuário",
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)))),
                            ),
                          ),
                          Container(
                            //! espaço
                            height: constraints.maxHeight * .05,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * .8,
                            child: TextField(
                              controller: senha,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              obscureText: !this._showPassword,
                              maxLines: 1,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: "Senha ",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() => this._showPassword =
                                          !this._showPassword);
                                    },
                                    icon: Icon(
                                     this._showPassword ? Icons.visibility : Icons.visibility_off ,
                                      color:  Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),

                      Container(
                        height: constraints.maxHeight *.05,
                      ), //!espaço
                      Container(
                          width: constraints.maxWidth * .6,
                          height: 50,
                          child: ElevatedButton(
                              child: Text("ENTRAR"),
                              onPressed: () {
                                DataBase.insert(
                                    "banco", {"paciente": usuario.text});
                                rps.loadpct();
                                print(rps.nome);
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => ScreenMain()),
                                );
                              })),
                    ]),
              ),
            )),
          );
        })),
      ),
    );
  }
}
