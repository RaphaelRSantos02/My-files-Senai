import 'package:flutter/material.dart';

import 'main.dart';

class tela_4 extends StatelessWidget {
  const tela_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("tela 4"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.red, width: 400, height: 180,
      child: Text('De nada adianta ter sonhos, se você não se empenhar em correr atrás', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")),
      ]
    ),
    );
  }
}