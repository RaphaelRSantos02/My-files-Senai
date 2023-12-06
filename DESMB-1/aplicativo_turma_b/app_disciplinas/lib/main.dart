import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: Home(),));
}

class Home extends StatefulWidget {
  const Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading:  Container(),
            title: Text('disciplinas'),
          ),
          body: ListView(
            children: [
              listadisciplinas("Matematica","imagens/matematica.jfif"),
              listadisciplinas("ciencia", "imagens/ciencia.jfif"),
              listadisciplinas("geografia", "imagens/geografia.jfif")
            ],
          ),
      )
    );
  }
}

class listadisciplinas extends StatefulWidget{
  final String  disciplinas; 
  final String img;

  const listadisciplinas(this.disciplinas, this.img, {super.key});
  
  @override
    State<listadisciplinas> createState() => _listadisciplinasState();
}

class _listadisciplinasState extends State<listadisciplinas>{
  @override
          Widget build(BuildContext context) {
            return Padding( padding: EdgeInsets.all(7.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("${widget.disciplinas}", style: TextStyle(fontSize: 30),),
                    Column(
                    children: [
                    Container(
                      color: Colors.white,
                      height: 150,
                      width: 290,
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