import 'package:flutter/material.dart';

import 'main.dart';

class tela_6 extends StatelessWidget {
  const tela_6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("tela 6"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.red, width: 400, height: 180,
      child: Text('Não se exija demais', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")),
      ]
    ),
    );
  }
}