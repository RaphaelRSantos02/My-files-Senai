import 'package:flutter/material.dart';
import 'package:multi_telas/main.dart';
import 'package:multi_telas/tela_2.dart';

class telaterciaria extends StatelessWidget {
  const telaterciaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("tela 3"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.purple, width: 400, height: 180,
      child: Text('Tela 3', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telasecundaria(),));
          }, child: Text("Tela 2")
          ),
      ]
    ),
  );
  }
}