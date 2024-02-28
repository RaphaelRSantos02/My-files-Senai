import 'package:ex1/tela_2.dart';
import 'package:ex1/tela_3.dart';
import 'package:ex1/tela_4.dart';
import 'package:ex1/tela_5.dart';
import 'package:ex1/tela_6.dart';
import 'package:flutter/material.dart';

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
        title: Text(''),
      ),
       body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.blue, width: 400, height: 180,
          child: Text('Tela 1', style: TextStyle(fontSize: 25),),),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela_2(),));
          }, child: Text("Tela 2")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela_3(),));
          }, child: Text("Tela 3")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela_4(),));
          }, child: Text("Tela 4")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela_5(),));
          }, child: Text("Tela 5")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela_6(),));
          }, child: Text("Tela 6")),
        ],
        )
    );
  }
}

