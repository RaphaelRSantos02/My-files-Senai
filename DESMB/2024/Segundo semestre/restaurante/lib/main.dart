import 'package:flutter/material.dart';

void main() {
  runApp(const Restaurante());
}

class Restaurante extends StatelessWidget {
const Restaurante({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Restaurante",
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 106, 15, 122),useMaterial3: true),
      home: ,
    );
  }
}