import 'package:flutter/material.dart';

void main() {
  runApp(const telaprincipal());
}

class telaprincipal extends StatelessWidget {
  const telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(
        title: Text("Aplicativo dinamico"),
      ),
      body: Center(child:  contador()),
      ),
    );
  }
}

class contador extends StatefulWidget {
  
  const contador({super.key});

  @override
  State<contador> createState() => _contadorState();
}

class _contadorState extends State<contador> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Color Bcolor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _nome,
          decoration: const InputDecoration(labelText: 'Enter Your Name',),
          style: const TextStyle(fontSize: 14),
          ),
          TextField(
            controller: _password,
            decoration: const InputDecoration(labelText: 'Enter Your Password'),
            style: const TextStyle(fontSize: 14),
          ),
        Container(color: Bcolor, height: 200, width: 200,),
        ElevatedButton(onPressed: (){
          setState(() {
            if(_nome.text == "raphael" && _password.text == "123"){
              Bcolor = Colors.green;
            }
            else{
            Bcolor = Colors.blue;
            }
          });
        }, 
        child: Text("verificar"))
      ],
    );
  }
}

