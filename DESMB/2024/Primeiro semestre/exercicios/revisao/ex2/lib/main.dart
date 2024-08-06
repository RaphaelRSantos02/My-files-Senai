import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
            title: Text('Cardapio'),
            ),
            body:
            Stack(
          alignment: Alignment.bottomCenter,
          children: [
             ListView( 
              children: [
          Comida("Lasanha", "imagens/LASANHA-BOLONHESA.jpg", 40,),
          Comida("Pizza de abacaxi", "imagens/pizza-com-abacaxi-e-hortelã.jpg", 999),
          Comida("Strogonoff", "imagens/56791d9fabcdd87edddb.png", 50),
          const SizedBox(
                  height: 110,
                )
        ],
      ),
      ]
      )
      )
    );
  }
}


class Comida extends StatefulWidget {
  final String nome;
  final String img;
  final int valor;


  const Comida(this.nome, this.img, this.valor, {super.key});

  @override
  State<Comida> createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  int n_comida = 0;
  int qtde = 0;
  int v1 = 0;
  int v2 = 0;
  int valor_final = 0;
  
   void _increment_counter(){
          setState(() {
            n_comida ++;
          });
        }
    void _increment_qtde(){
      setState(() {
        qtde ++;
      });
    }

  void _reset_counter(){
    setState(() {
      n_comida = 0;
      valor_final = 0;
    });
  }

  void _soma(){
    setState(() {
      v1 = n_comida * widget.valor;
      v2 = qtde;
      valor_final = v1 + v2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
            children: [ Column(
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
                      Text("R\$ ${widget.valor}/ - quantidade: ${qtde} ", style: TextStyle(fontSize: 20, color: Colors.red),)
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                      child: Text("quantidade: $n_comida",style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,),
                    ),
                    
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text("valor da refeição: $valor_final R\$", style: TextStyle(fontSize: 20,), textAlign: TextAlign.left,)
                      )
                    ],
                  ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                    _increment_counter();
                    print(n_comida);
                  }, child: Icon(Icons.add)),
                    ElevatedButton(onPressed: (){
                    _increment_qtde();
                    print(qtde);
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
        ),
        ]
      )
      )
    );

  }
}