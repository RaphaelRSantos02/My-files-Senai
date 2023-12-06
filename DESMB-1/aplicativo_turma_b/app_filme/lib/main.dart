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
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading:  Container(),
            title: Text('Filmes'),
          ),
          body: ListView(
            children: [
              listaFilmes("Superhero","imagens/Superheros.jpg"),
              listaFilmes("click", "imagens/click.jpg"),
              listaFilmes("gente grande", "imagens/genteGrande.jpg")
            ],
          ),
      )
    );
  }
}

class listaFilmes extends StatefulWidget{
  final String  filmes; 
  final String img;

  const listaFilmes(this.filmes, this.img, {super.key});
  
  @override
    State<listaFilmes> createState() => _listaFilmesState();
}

class _listaFilmesState extends State<listaFilmes>{
  @override
          Widget build(BuildContext context) {
            return Padding( padding: EdgeInsets.all(7.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("${widget.filmes}", style: TextStyle(fontSize: 30),),
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