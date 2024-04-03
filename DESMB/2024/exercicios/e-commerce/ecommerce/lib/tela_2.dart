import 'package:ecommerce/tela_3.dart';
import 'package:flutter/material.dart';

class cliente extends StatefulWidget {
  const cliente({super.key});

  @override
  State<cliente> createState() => _clienteState();
}

class _clienteState extends State<cliente> {


  int n_estoque = 0;
  int v = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras"),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}