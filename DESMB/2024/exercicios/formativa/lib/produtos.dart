import 'package:flutter/material.dart';
import 'package:formativa/mercado.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class produtos extends StatefulWidget {
  const produtos({super.key});

  @override
  State<produtos> createState() => _produtosState();
}

class _produtosState extends State<produtos> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _qtde = TextEditingController();
  final TextEditingController _valor = TextEditingController();

  String url = "http://10.109.83.7:3000/produtos";

  _post(){
    http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'email': _nome.text, 'valor':_valor.text, 'qtde': _qtde.text}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produtos"),
      ),
      body: 
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 362,
              height: 345,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _nome,
                      decoration: InputDecoration(labelText: "Digite o nome do produto",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                        ),
                        icon: Icon(
                          Icons.production_quantity_limits
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _valor,
                      decoration: InputDecoration(labelText: "digite o valor do produto",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                      ),
                      icon: Icon(
                        Icons.production_quantity_limits
                      )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _qtde,
                      decoration: InputDecoration(labelText: "digite o valor do produto",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero
                        ),
                      icon: Icon(
                        Icons.production_quantity_limits
                      )
                    ),
                    ),
                  ),
                  
                  ElevatedButton(onPressed: _post(), child: Text("Cadastrar produto")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> mercado(),));
                    });
                  }, child: Text("Produtos"))
                ]
                ),
            ),
          ],
        ),
      ),
    );;
  }
}