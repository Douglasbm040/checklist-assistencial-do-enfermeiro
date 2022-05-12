//import 'dart:ffi';
//ignore_for_file: prefer_const_constructors
import '../database/date_local.dart';
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
  salvardb() {
    DataBase.insert("banco", {
      "id": senha.text,
      "paciente": usuario.text,
    });
  }
  checking()async{
    final datalist = await DataBase.getdata("banco");
    print(datalist);
  }

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 500,
            height: 600,
            child: SingleChildScrollView(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                          child: Column(
                        children: [
                          Container(
                            height: 10,
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
                          Text("LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w200)),
                        ],
                      )),
                      height: 250,
                    ),

                    Column(
                      children: [
                        SizedBox(
                          width: 400,
                          child: TextField(
                            controller: usuario,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: "usuario",
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                        Container(
                          //! espaço
                          height: 40,
                        ),
                        SizedBox(
                          width: 400,
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
                              labelText: "Digite a senha ",
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
                                    Icons.remove_red_eye,
                                    color: this._showPassword
                                        ? Colors.blue[100]
                                        : Colors.white,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),

                    Container(
                      height: 50,
                    ), //!espaço
                    Container(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                            child: Text("ENTRAR"),
                            onPressed: () {
                              salvardb;
                              checking;
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => ScreenMain()),
                              );
                            })),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
