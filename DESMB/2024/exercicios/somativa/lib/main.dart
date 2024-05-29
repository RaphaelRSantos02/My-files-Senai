import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cadastro.dart';
import 'dart:convert';
import 'movies.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    routes: {
      '/movies': (context) => MoviesScreen(),
    },
    theme: ThemeData(
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
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
        Navigator.pushNamed(context, '/movies');
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email/Senha estão incorretos')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Coloque seu email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: _password,
                obscureText: !exibir,
                decoration: InputDecoration(
                  labelText: "Coloque sua senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.teal,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(exibir ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        exibir = !exibir;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _getusuario();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[200],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[200],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}