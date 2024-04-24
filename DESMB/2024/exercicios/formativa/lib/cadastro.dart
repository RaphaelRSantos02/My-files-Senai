import 'package:flutter/material.dart';
import 'package:formativa/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String url = "http://10.109.83.7:3000/usuarios";

  _post(){
    Map<String, dynamic>mensagem = {
      "email":"${_email.text}",
      "senha":"${_password.text}"
    };
    http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },
      body: jsonEncode(mensagem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: 
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 362,
              height: 262,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(labelText: "Cadastre seu email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                        ),
                        icon: Icon(
                          Icons.people_alt,
                          color: Colors.red,
                          size: 30.0,
                          )        
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _password,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(labelText: "Cadastre sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                      ), 
                      icon: Icon(
                        Icons.key,
                        color: Colors.red,
                        size: 30.0,
                      )
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(),));
                     _post();
                   
                    
                  }, child: Text("cadastre-se")),
                  ElevatedButton(onPressed: (){}, child: Text("Deletar"))
                ]
                ),
            ),
          ],
        ),
      ),
    );;
  }
}