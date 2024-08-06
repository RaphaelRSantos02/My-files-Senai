import 'package:ex2/main.dart';
import 'package:flutter/material.dart';

class tela_2 extends StatelessWidget {
  const tela_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Compras"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Color.fromARGB(255, 142, 250, 160), width: 400, height: 180,
      child: Text('Aqui está suas compras: ', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => welcome(),));
          }, child: Text("tela 1")),
      ]
    ),
    );
  }
}