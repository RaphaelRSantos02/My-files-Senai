import 'package:flutter/material.dart';
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
  bool exibir = false;


  Future<void> _getusuario() async {
    final String email = _email.text;
    final String password = _password.text;

    final response = await http.get(Uri.parse(url));
    final List<dynamic> usuarios = jsonDecode(response.body);

    for (var usuario in usuarios) {
      if (usuario['email'] == email && usuario['senha'] == password) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login com sucesso')));

        return ;
      }
    }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email/Senha estão incorretos')));
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
              height: 272,
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
                      ),
                      suffixIcon: IconButton(icon: Icon(exibir ? Icons.visibility : Icons.visibility_off), onPressed: (){
                        setState(() {
                          exibir = !exibir;
                        });
                      },)
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    _getusuario();
                  }, child: Text("Entrar")),
                  ElevatedButton(onPressed: (){
                    setState(() {
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