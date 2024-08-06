import 'package:flutter/material.dart';
import 'package:login/tela_2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login(),
    ));
}
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
    final TextEditingController _nome = TextEditingController();
    final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo com multipas telas"),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _nome,
          decoration: const InputDecoration(labelText: 'Enter Your Name',),
          style: const TextStyle(fontSize: 14),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            obscuringCharacter: "*",
            decoration: const InputDecoration(labelText: 'Enter Your Password'),
            style: const TextStyle(fontSize: 14),
          ),
        
        ElevatedButton(onPressed: (){
          setState(() {
            if(_nome.text == "raphael" && _password.text == "123"){
               Navigator.push(context, MaterialPageRoute(builder: (context) => welcome(),));
            }
            else{
            Text("Senha errada");
            }
          });
        }, 
        child: Text("verificar"))
      ],
    )
    );
  }
}
