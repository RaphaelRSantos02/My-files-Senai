import 'package:flutter/material.dart';

import 'main.dart';


class tela_3 extends StatelessWidget {
  const tela_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("tela 3"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.red, width: 400, height: 180,
      child: Text('Os presentes de cada dia', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")),
      ]
    ),
    );
  }
}