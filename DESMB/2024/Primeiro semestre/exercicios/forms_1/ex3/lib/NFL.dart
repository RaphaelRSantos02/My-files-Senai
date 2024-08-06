import 'package:ex3/basquete.dart';
import 'package:ex3/main.dart';
import 'package:flutter/material.dart';

class NFL extends StatelessWidget {
  const NFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("basquete"),
      ),
      body: ListView(
            children: [
              jogadores_NFL("Travis","imagens/travis.jpg"),
              ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => futebol(),));
          }, child: Text("futebol")),
              ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => basquete(),));
          }, child: Text("basquete"))
            ],
          ),
    );
  }
}

class jogadores_NFL extends StatefulWidget{
  final String  jogador; 
  final String img;

  const jogadores_NFL(this.jogador, this.img, {super.key});
  
  @override
    State<jogadores_NFL> createState() => _jogadores_NFLState();
}

class _jogadores_NFLState extends State<jogadores_NFL>{
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
