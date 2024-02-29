import 'package:ex3/NFL.dart';
import 'package:ex3/basquete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: futebol(),
  ));
}

class futebol extends StatelessWidget {
  const futebol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('futebol'),
      ),
      body: ListView(
            children: [
              jogadores("Cristiano Ronaldo","imagens/cr7.jpg"),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => basquete(),));
          }, child: Text("basquete")),
          ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NFL(),));
          }, child: Text("NFL"))
            ],
          ),
    );
  }
}



class jogadores extends StatefulWidget{
  final String  jogador; 
  final String img;

  const jogadores(this.jogador, this.img, {super.key});
  
  @override
    State<jogadores> createState() => _jogadoresState();
}

class _jogadoresState extends State<jogadores>{
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