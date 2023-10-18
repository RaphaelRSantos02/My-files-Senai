import 'package:flutter/material.dart';
/*
Aplicativo aula 06 - Desenvolvimento
*/
int cont =0;
// função que realiza contagem e exibe mensagens
void _msg(){
  cont = cont+1;
  print("Desenvolvimento mobile 1");
  print("Contagem $cont");
}
void _msg2(){
  cont = cont-1;
  print("Contagem $cont");
  print("Senai");
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.red, width: 400, height: 80),
                Container(color: Colors.blue, width: 350,height: 50,
                child:Text("Mobile", style:TextStyle(decoration: TextDecoration.none,
                color: Colors.white),textAlign: TextAlign.center,)),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: Colors.blue, width: 50, height: 50),
                  Container(
                  color: Colors.green, width: 50, height: 50),
                  Container(
                  color: Colors.red, width: 50, height: 50),
              ],
            ),
            Container(
              color: Colors.amber,
              height: 50,
              width: 300,
              child: Text("Senai",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                decoration: TextDecoration.none),
                textAlign: TextAlign.center,),
            ),
            
            ElevatedButton(onPressed:(){
              print("Você apertou o botão");
            },
            child: Text("Botão 1"),
            ),
            ElevatedButton(onPressed: _msg, child:Text("Mensagem 1")),
            ElevatedButton(onPressed: _msg2, child: Text("Mensagem 2"))
          ],
        ),
      )
    );
  }
}