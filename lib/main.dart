import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calculadora Divisas',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Reto 1 - Grupo 9'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final txtorigen = TextEditingController();
final txtdestino = TextEditingController();

class calculadora {
  final titulo;
  final icono1;
  final color;

  calculadora(this.titulo, this.icono1, this.color);
}

//var items = ["USD", "EUR", "COP"];
//List <String> item2 = <String>["USD", "EUR", "COP"];
String op1 = "USD";
String op2 = "COP";

List<DropdownMenuItem<String>> item3 = <DropdownMenuItem<String>>[
  DropdownMenuItem(
    child: Text("USD"),
    value: "USD",
  ),
  DropdownMenuItem(
    child: Text("EUR"),
    value: "EUR",
  ),
  DropdownMenuItem(
    child: Text("COP"),
    value: "COP",
  ),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Icon(Icons.abc), Colors.grey[600]),
  calculadora("8", Icon(Icons.abc), Colors.grey[600]),
  calculadora("7", Icon(Icons.abc), Colors.grey[600]),
  calculadora("6", Icon(Icons.abc), Colors.grey[600]),
  calculadora("5", Icon(Icons.abc), Colors.grey[600]),
  calculadora("4", Icon(Icons.abc), Colors.grey[600]),
  calculadora("3", Icon(Icons.abc), Colors.grey[600]),
  calculadora("2", Icon(Icons.abc), Colors.grey[600]),
  calculadora("1", Icon(Icons.abc), Colors.grey[600]),
  calculadora("0", Icon(Icons.abc), Colors.grey[600]),
  calculadora(
      "Limpiar",
      Icon(
        Icons.backspace,
        color: Colors.black,
        size: 25,
      ),
      Colors.grey[700]),
  calculadora(
      "Calcular",
      Icon(
        Icons.view_agenda,
        color: Colors.black,
      ),
      Colors.grey[700]),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Divisa  ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 21, 19, 18))),
                  DropdownButton(
                      value: op1,
                      items: item3,
                      onChanged: (String? x) {
                        setState(() {
                          op1 = x.toString();
                        });
                      }),
                  VerticalDivider(),
                  VerticalDivider(),
                  VerticalDivider(),
                  Text("Pasar a:  ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 21, 19, 18))),
                  DropdownButton(
                      value: op2,
                      items: item3,
                      onChanged: (String? x) {
                        setState(() {
                          op2 = x.toString();
                        });
                      }),
                ],
              ),
              TextField(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: txtorigen,
                decoration: InputDecoration(
                  labelText: "Cantidad",
                  hintText: "0",
                ),
              ),
              Divider(),
              TextField(
                enabled: false,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: txtdestino,
                decoration:
                    InputDecoration(labelText: "Resultado", hintText: "0"),
              ),
              Divider(),
              Divider(),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: cal.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          color: cal[index].color,
                          child: ListTile(
                            title: Center(
                              child: index > 9
                                  ? cal[index].icono1
                                  : Text(
                                      cal[index].titulo,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                            ),
                            onTap: () {
                              print(cal[index].titulo);
                              if (index < 10) {
                                txtorigen.text =
                                    txtorigen.text + cal[index].titulo;
                              } else if (index == 10) {
                                txtorigen.text = "";
                                txtdestino.text = "";
                              } else {
                                if (op1 == "USD" && op2 == "COP") {
                                  var result =
                                      (double.parse(txtorigen.text) * 5000);
                                  NumberFormat f = new NumberFormat(
                                      "#,##0.00 COP", "es_COP");
                                  txtdestino.text =
                                      (f.format(result)).toString();
                                } else if (op1 == "COP" && op2 == "USD") {
                                  var result =
                                      (double.parse(txtorigen.text) / 5000);
                                  NumberFormat f =
                                      new NumberFormat("#,##0.00 US", "en_US");
                                  txtdestino.text =
                                      (f.format(result)).toString();
                                } else if (op1 == "EUR" && op2 == "COP") {
                                  var result =
                                      (double.parse(txtorigen.text) * 5050);
                                  NumberFormat f = new NumberFormat(
                                      "#,##0.00 COP", "es_COP");
                                  txtdestino.text =
                                      (f.format(result)).toString();
                                } else if (op1 == "COP" && op2 == "EUR") {
                                  var result =
                                      (double.parse(txtorigen.text) / 5050);
                                  NumberFormat f =
                                      new NumberFormat("#,##0.00 EU", "es_EU");
                                  txtdestino.text =
                                      (f.format(result)).toString();
                                } else if (op1 == "EUR" && op2 == "USD") {
                                  var result =
                                      (double.parse(txtorigen.text) * 0.99);
                                  NumberFormat f =
                                      new NumberFormat("#,##0.00 US", "en_US");
                                  txtdestino.text =
                                      (f.format(result)).toString();
                                } else if (op1 == "USD" && op2 == "EUR") {
                                  var result =
                                      (double.parse(txtorigen.text) / 5000);
                                  NumberFormat f =
                                      new NumberFormat("#,##0.00 US", "es_EUR");
                                  txtdestino.text =
                                      (f.format(result)).toString();
                                  //txtdestino.text =
                                  //(double.parse(txtorigen.text) / 5000)
                                  //.toStringAsFixed(4);
                                } else {
                                  txtdestino.text = txtorigen.text;
                                }
                              }
                            },
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}
