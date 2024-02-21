import 'package:flutter/material.dart';
import 'package:multi_telas/tela_2.dart';
import 'package:multi_telas/tela_3.dart';
import 'package:multi_telas/contador.dart';
import 'package:multi_telas/tela_5.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: telapricipal(),
  ));
}

class telapricipal extends StatelessWidget {
  const telapricipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo com multipas telas"),
      ),
      body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.blue, width: 400, height: 180,
          child: Text('Tela 1', style: TextStyle(fontSize: 25),),),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telasecundaria(),));
          }, child: Text("Tela 2")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telaterciaria(),));
          }, child: Text("Tela 3")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telacontador(),));
          }, child: Text("Contador")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => campoTexto(),));
          }, child: Text("Campo texto")),

        ],
        
        ),
    );
  }
}