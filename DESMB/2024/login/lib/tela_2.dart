import 'package:flutter/material.dart';
import 'package:login/main.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Bem vindo"),
    ),
    body: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(color: Colors.red, width: 400, height: 180,
      child: Text('Bem vindo', style: TextStyle(fontSize: 25),)),
      ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
          }, child: Text("tela 1")),
      ]
    ),
  );
  }
}