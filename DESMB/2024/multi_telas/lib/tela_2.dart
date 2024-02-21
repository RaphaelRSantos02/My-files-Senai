import 'package:flutter/material.dart';
import 'package:multi_telas/main.dart';
import 'package:multi_telas/tela_3.dart';

class telasecundaria extends StatelessWidget {
  const telasecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("tela 2"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.red, width: 400, height: 180,
      child: Text('Tela 2', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telaterciaria(),));
          }, child: Text("Tela 3")),
      ]
    ),
  );
  }
}