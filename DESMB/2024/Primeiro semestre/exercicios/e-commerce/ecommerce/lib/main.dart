import 'package:ecommerce/tela_2.dart';
import 'package:ecommerce/tela_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: login(),
  ));
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  int op = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 295,
              height: 220,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: _name,
                      decoration:InputDecoration(labelText: "Coloque seu nome",
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                              ),
                            ),
                              style: const TextStyle(fontSize: 14),
                           ),
                  ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _password,
                obscureText: true,
                obscuringCharacter: "*",
                decoration:InputDecoration(labelText: "Coloque sua senha",
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40)
                       ),
                      ),
                style: const TextStyle(fontSize: 14,),
              ),
            ),
             Row(
              children: [
                Expanded(
                  child: 
                ListTile(
                 title: Text("admin"),
                 leading: Radio<int>(
                  value: 1,
                  groupValue: op,
                  onChanged: (value){
                    setState(() {
                  op = 1;
                });
              },
                 ), 
                )
              ),
              Expanded(
                child: 
                ListTile(
                  title: Text("cliente"),
                  leading: Radio<int>(
                    value: 2,
                    groupValue: op,
                    onChanged: (value){
                      setState(() {
                  op = 2;
                });
              },
                  ),
                ),
              )
              ],
            ),
                ]
                ),
            ),
            
           
            ElevatedButton(
            onPressed: 
            (){
             setState(() {
               if (_name.text == "admin" && _password.text == "1111" && op == 1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> admin(),));
               } 
               else if(_name.text == "raphael" && _password.text == "123" && op == 2){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> cliente(),));
               }

               else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Usuario ou senha errado"), duration: Duration(seconds: 2),)
                  );
               }
             }); 
            }, child: Text("Entrar")
            )
          ],
        ),
      )
    );
  }
}