import 'package:ex3/NFL.dart';
import 'package:ex3/main.dart';
import 'package:flutter/material.dart';

class basquete extends StatelessWidget {
  const basquete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("basquete"),
      ),
      body: ListView(
            children: [
              jogadores_basquete("Michael Jordan","imagens/michael.jpg"),
              ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => futebol(),));
          }, child: Text("futebol")),
              ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NFL(),));
          }, child: Text("NFL"))
            ],
          ),
    );
  }
}

class jogadores_basquete extends StatefulWidget{
  final String  jogador; 
  final String img;

  const jogadores_basquete(this.jogador, this.img, {super.key});
  
  @override
    State<jogadores_basquete> createState() => _jogadores_basqueteState();
}

class _jogadores_basqueteState extends State<jogadores_basquete>{
  @override
          Widget build(BuildContext context) {
            return Padding( padding: EdgeInsets.all(7.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("${widget.jogador}", style: TextStyle(fontSize: 30),),
                    Column(
                    children: [
                    Container(
                      color: Colors.white,
                      height: 250,
                      width: 393,
                      child: Image.asset(widget.img, fit: BoxFit.fill,),
                    ),      
                ]
              ),
                  ],
                )
              ],
            ),
            );

          }
}