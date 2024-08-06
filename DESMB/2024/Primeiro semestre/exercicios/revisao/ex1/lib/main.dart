import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SM(),
  ));
}

class SM extends StatefulWidget {
  const SM({super.key});

  @override
  State<SM> createState() => _SMState();
}

class _SMState extends State<SM> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _idade = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _telefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.name,
              controller: _nome,
              decoration: InputDecoration(labelText: "Coloque seu nome"),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: InputDecoration(labelText: "Coloque seu email"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _idade,
              decoration: InputDecoration(labelText: "Coloque sua idade"),
            ),
            TextField(
              keyboardType: TextInputType.streetAddress,
              controller: _endereco,
              decoration: InputDecoration(labelText: "Coloque seu endereço"),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: _telefone,
              decoration: InputDecoration(labelText: "Coloque seu telefone"),
            ),
            ElevatedButton(onPressed: (){
              print(_nome.text);
              print(_idade.text);
              print(_email.text);
              print(_endereco.text);
              print(_telefone.text);
      
            }, child:Text("Ler") )
          ],
        ),
      ),
    );
  }
}