import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class mercado extends StatefulWidget {
  const mercado({super.key});

  @override
  State<mercado> createState() => _mercadoState();
}

class _mercadoState extends State<mercado> {

  _get(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:(){
              setState(() {
                _get();
              });
            }, child: Text("Ler")),             
            Column(         
                 
            ),
          ],
        ),
      ),
    );
  }
}

