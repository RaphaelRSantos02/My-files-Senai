import 'package:flutter/material.dart';
import 'package:multi_telas/main.dart';

class telacontador extends StatefulWidget {
  const telacontador({super.key});

  @override
  State<telacontador> createState() => _telacontadorState();
}
    int cont = 0;
class _telacontadorState extends State<telacontador> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Center(
            child: Container(color: Colors.pink, width: 100, height: 100,
            child: Text("Contagem: " + "$cont"),),
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              cont++;
            });

          }, child: Icon(Icons.add)
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              cont--;
            });

          }, child: Icon(Icons.remove)
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => telapricipal(),));
          }, child: Text("tela 1")
          ),
          
        ],
      ),
    );
  }
}