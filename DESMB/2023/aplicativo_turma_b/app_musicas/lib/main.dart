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
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading:  Container(),
            title: Text('Musicas'),
          ),
          body: ListView(
            children: [
              listaMusica("One day","imagens/oneday.jpg"),
              listaMusica("Team Bolas", "imagens/bolas.jfif"),
              listaMusica("toxicity", "imagens/toxicity.jpg")
            ],
          ),
      )
    );
  }
}

class listaMusica extends StatefulWidget{
  final String  musica; 
  final String img;

  const listaMusica(this.musica, this.img, {super.key});
  
  @override
    State<listaMusica> createState() => _listaMusicaState();
}

class _listaMusicaState extends State<listaMusica>{
  @override
          Widget build(BuildContext context) {
            return Padding( padding: EdgeInsets.all(7.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("${widget.musica}", style: TextStyle(fontSize: 30),),
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