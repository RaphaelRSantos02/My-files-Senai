import 'package:flutter/material.dart';
import 'package:formativa/cadastro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String url = "http://10.109.83.7:3000/usuarios";
  List dado=[];
  var usuarios = <Usuarios>[];

  _getusuario()async{
    http.Response resposta = await http.get(Uri.parse(url));
    dado = json.decode(resposta.body);
    for(int i =0; i<dado.length; i++)
    {
      print(dado[i]);
    }
    setState(() {
      usuarios = dado.map((json) => Usuarios.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                      decoration: InputDecoration(labelText: "Coloque seu email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                        ),
                        icon: Icon(
                          Icons.people_alt,
                          color: Colors.blue,
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
                      decoration: InputDecoration(labelText: "Coloque sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero
                      ), 
                      icon: Icon(
                        Icons.password,
                        color: Colors.blue,
                        size: 30.0,
                      )
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    _getusuario();
                  }, child: Text("Entrar")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Cadastro(),));
                    });
                  }, child: Text("cadastre-se"))
                ]
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class Usuarios{
  String id;
  String email;
  String senha;
  Usuarios(this.id, this.email, this.senha);
  factory Usuarios.fromJson(Map<String, dynamic>json){
    return Usuarios(json["id"], json["email"], json["senha"]);
  }
}