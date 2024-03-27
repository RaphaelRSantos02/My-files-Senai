import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
   Home({super.key});
   TextEditingController nome = TextEditingController();
   TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Aula 8 exemplo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Center(child: Container(width: 150, height: 150, 
          decoration: BoxDecoration(color: Colors.blueGrey, 
          borderRadius: BorderRadius.circular(20)
          ),
          ),
          ),
          Container(width: 200,
          height: 200, 
          decoration: BoxDecoration(color: Colors.blueAccent,),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(labelText: "Digite seu nome"),
                cursorColor: Colors.white,
                controller: nome,
              ),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(labelText: "Digite sua senha"),
                obscureText: true,
                obscuringCharacter: "#",
                cursorColor: Colors.white,
                controller: senha,
              ),
              ElevatedButton(onPressed: (){
                print(nome.text);
                print(senha.text);
              }, child: Icon(Icons.account_circle))
            ]
            ),
          )
          ],
        ),
      ),
    );
  }
}