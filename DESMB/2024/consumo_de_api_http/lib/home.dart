import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  _consultaCep () async{
  String url = "https://cep.awesomeapi.com.br/13091132";
  http.Response response;
  response = await http.get(Uri.parse(url));
  print("Codigo de status da api:  ${response.statusCode.toString()}");
  print("resposta da api:  ${response.body}");
  String ? logradouro;
  String ? bairro;
  String ? cidade;
  String ? estado;
  String ? ddd;

  Map<String,dynamic>dados = json.decode(response.body);
  logradouro = dados ['address'];
  print("logradouro: $logradouro");
  bairro = dados ['district'];
  print("bairro: $bairro");
  cidade = dados ['city'];
  print("cidade: $cidade");
  estado = dados ['state'];
  print("estado: $estado");
  ddd = dados ['ddd'];
  print("ddd: $ddd");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App consulta CEP'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              _consultaCep();
              

            });
          }, child: Text("Cep"),),
        ],
      ),
    );
  }
}