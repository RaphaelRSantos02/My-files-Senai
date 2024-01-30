import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
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
            title: Text('SVAR - Hospedagens'),
            ),
            body: ListView(
              children: [
                Viagem("Angra dos Reis", "imagens/483860960.jpg", 384, 70),
                Viagem("Jericoacoara", "imagens/jericoacoara.jpg", 571, 75),
                Viagem("Arraial do Cabo", "imagens/arraialdocabo.jpg", 534, 65),
                Viagem("Florianópolis", "imagens/florianopoles.jpg", 348, 85),
                Viagem("Madri ", "imagens/madri.jpg", 401, 85),
                Viagem("Paris", "imagens/paris.jpg", 546, 95),
                Viagem("Orlando", "imagens/orlando.jpg", 616, 105),
                Viagem("Las Vegas", "imagens/lasvegas.jpg", 504, 110),
                Viagem("Roma", "imagens/roma.jpg", 478, 85),
                Viagem("Chile", "imagens/chile.jpeg", 446, 95),

              ],
            ),
          ),

    );
  }
}
class Viagem extends StatefulWidget{
  final String nome;
  final String img;
  final int valor_viagem;
  final int valor_pessoa;

  const Viagem(this.nome, this.img, this.valor_viagem, this.valor_pessoa, {super.key});
    
    
    @override
    State<Viagem> createState() => _ViagemState();
  }

class _ViagemState extends State<Viagem>{
  
  int n_diaria = 0;
  int n_pessoa = 0;
  int v1 = 0;
  int v2 = 0;
  int valor_final = 0;
  
   void _increment_counter(){
          setState(() {
            n_diaria ++;
          });
        }
    void _increment_people(){
      setState(() {
        n_pessoa ++;
      });
    }

  void _reset_counter(){
    setState(() {
      n_diaria = 0;
      n_pessoa = 0;
      valor_final = 0;
    });
  }

  void _soma(){
    setState(() {
      v1 = n_diaria * widget.valor_viagem;
      v2 = n_pessoa * widget.valor_pessoa;
      valor_final = v1 + v2;
    });
  }
        
        @override
          Widget build(BuildContext context) {
            return Padding( padding: EdgeInsets.all(7.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("${widget.nome}", style: TextStyle(fontSize: 30),),
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
                Column(
                  children: [
                    Text("R\$ ${widget.valor_viagem}/ dia - R\$ ${widget.valor_pessoa} por pessoa", style: TextStyle(fontSize: 20, color: Colors.red),)
                  ],
                ),
                Row(
                  children: [
                    Container(
                    child: Text("quantidade de dias $n_diaria",style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,),
                  )
                  ],
                ),
                Row(
                  children: [
                    Container(
                    child: Text("quantidade de pessoas $n_pessoa",style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,),
                  )
                  ],),
                Row(
                  children: [
                    Container(
                      child: Text("valor da viagem: $valor_final R\$", style: TextStyle(fontSize: 20,), textAlign: TextAlign.left,)
                    )
                  ],
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                  _increment_counter();
                  print(n_diaria);
                }, child: Icon(Icons.add)),

                ElevatedButton(onPressed: (){
                  _increment_people();
                  print(n_pessoa);
                }, child: Icon(Icons.add)),
                  ],
               ),
               Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ElevatedButton(onPressed: (){
                  _soma();
                  print(valor_final);
                }, child: Text("calcular")),
                ElevatedButton(onPressed: (){
                  _reset_counter();
                }, child: Text("limpar"))
               ],)
            ],
            
          )      
        ]
      )
    );

  }
}