import 'package:flutter/material.dart';
TextEditingController _user =TextEditingController();

class campoTexto extends StatelessWidget {
  const campoTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo texto"),
      ),
      body: Column(children: [
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(labelText: "Digite seu nome"),
          /*onChanged: (String texto){
            print("$texto");
          }
          
          onSubmitted: (String texto){
          print ("$texto");
          }
          */
          controller: _user,  
        ),
          ElevatedButton(onPressed: () {
            print(_user.text);
          }, child: Text("exibir"),)
      ]),
    );
  }
}