import 'package:ex2/tela_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: welcome(),
  ));
}

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boas vindas'),
      ),
      body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: const Color.fromARGB(255, 147, 197, 238), width: 500, height: 180,
          child: Text('Boas vindas', style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => tela_2(),));
          }, child: Text("Tela 2")),
        ]
        ),
    );
  }
}