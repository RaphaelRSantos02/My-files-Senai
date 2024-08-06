import 'package:ex1/main.dart';
import 'package:flutter/material.dart';


class tela_2 extends StatelessWidget {
  const tela_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("tela 2"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.red, width: 400, height: 180,
      child: Text('Enfrente os problemas e leve a melhor!', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")),
      ]
    ),
    );
  }
}