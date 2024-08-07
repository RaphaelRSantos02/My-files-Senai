import 'package:ex4/main.dart';
import 'package:ex4/matematica.dart';
import 'package:ex4/portugues.dart';
import 'package:flutter/material.dart';

class geografia extends StatefulWidget {
  const geografia({super.key});

  @override
  State<geografia> createState() => _geografiaState();
}

class _geografiaState extends State<geografia> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _nota_1 = TextEditingController();
  final TextEditingController _nota_2 = TextEditingController();
  final TextEditingController _nota_3 = TextEditingController();

  int media = 0;

  String status = 'Digite as notas e clique no botão para mostrar o status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disciplina de geografia"),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _nome,
          decoration: const InputDecoration(labelText: 'insira seu Nome',),
          style: const TextStyle(fontSize: 14),
          ),
          TextField(
            controller: _nota_1,
            decoration: const InputDecoration(labelText: 'Insira sua primeira nota'),
            style: const TextStyle(fontSize: 14),
          ),
          TextField(
            controller: _nota_2,
            decoration: const InputDecoration(labelText: 'Insira sua segunda nota'),
            style: const TextStyle(fontSize: 14),
          ),
          TextField(
            controller: _nota_3,
            decoration: const InputDecoration(labelText: 'Insira sua terceira nota'),
            style: const TextStyle(fontSize: 14),
          ),
        
        ElevatedButton(onPressed: (){
          media = int.parse(_nota_1.text) + int.parse(_nota_2.text) + int.parse(_nota_3.text);
          if (media < 7){
            setState(() {
              status = 'Status: Não Passou :(';
            });
          }
          else{
            setState(() {
              status = 'Status: Passou >:D';
            });
          }
        }, 
        child: Text("verificar")),
        Container(
          child: Text(status),
        ),
        ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => portugues(),));
          }, child: Text("portugues")),
        ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ciencia(),));
          }, child: Text("ciecias")),
        ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => matematica(),));
          }, child: Text("matematica")),
      ],
      

    )
      );
  }
}