import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

void main() {
  runApp( MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "http://10.109.83.7:3000/produtos";
  List dado = [];
  var produtos = <Produto>[];
  //List<int> valor= [];


  _getdados()async{
    http.Response resposta = await http.get(Uri.parse(url));
    //var dado = json.decode(resposta.body);
    dado = json.decode(resposta.body);
    //Map<String, dynamic> dado =  json.decode(resposta.body) as List; 
    for(int i=0; i<dado.length; i++){
          print(dado[i]);
    }
    setState(() {
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
  }
  _post(){
    Map<String,dynamic> mensagem={
     "id":"8",
     "nome":"PS5",
     "valor":"3700"
    };
    http.post(
      Uri.parse(url),
      headers: <String, String>{
        "content-type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(mensagem),
    );
  }

  _deletepost(){
    http.delete(Uri.parse("http://10.109.83.7:3000/produtos/8"));
    print("Item deletado");
  }
  _put(){
     http.put(Uri.parse('http://10.109.83.7:3000/produtos/8'),
    headers: <String,String>{
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({"id":"8","nome":"Nintendo Switch","valor":"2800" }),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App http metodos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Get, Post, Put, Delete https", style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed:_getdados, child: Text("ler")),
            ElevatedButton(onPressed: _post, child: Text("Enviar")),
            ElevatedButton(onPressed: _deletepost, child: Text("Deletar")),
            Column(
              children: produtos.map((produto) => Text("${produto.nome}- ${produto.valor}", style: TextStyle(fontSize: 18))).toList()
            )
          ]
          ),
      ),
    );
  }
}

class Produto{
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);
  factory Produto.fromJson(Map<String, dynamic> json){
    return Produto(json["id"], json["nome"], json["valor"]);
  }
}

class Produto_n{
  List prod = [];
  Produto_n(this.prod);
}