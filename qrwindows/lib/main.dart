import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'cadastro do paciente'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List <String,int> json = [] ;
  String valor = '';
  TextEditingController nomeController = TextEditingController();
  TextEditingController atendimentoController = TextEditingController();
 
  int _counter = 0;

  void atualizarqr() {
    setState(() {
      valor = nomeController.text + " " + atendimentoController.text ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                SingleChildScrollView(
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
                            Text("cadastro",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w100)),
                          ],
                        )),
                        height: 250,
                      ),
        
                      Column(
                        children: [
                          SizedBox(
                            width: 400,
                            child: TextField(
                              controller: nomeController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  labelStyle: TextStyle(color: Colors.black),
                                  labelText: "nome do paciente",
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
                              controller : atendimentoController ,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  labelStyle: TextStyle(color: Colors.black),
                                  labelText: "atendimento",
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)))),
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
                          onPressed: atualizarqr,
                        ),
                      ),
                      QrImage(
                        data: valor,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                ),
                // floatingActionButton: FloatingActionButton(
                //   onPressed: _incrementCounter,
                //   tooltip: 'Increment',
                //   child: const Icon(Icons.add),
                // ), // This trailing comma makes auto-formatting nicer for build methods.
              ])),
        ));
  }
}
