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
      body: ListView(
       scrollDirection: Axis.vertical,
        children: [
            produto("PS5", "https://m.media-amazon.com/images/I/612SFC+tsbL._AC_SX342_SY445_.jpg", 3000),
            produto("Iphone", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSMtnJ7_VIZEW8HeMPHD144gt_tnrSIMrOxzYmixoRNl7UF-IjSBqIastqUiOuBnwujMW_6v2oFVBrKiwD46Vypd5Xt-IAvGp031HDjRdze01sjk2hT58dbAh4&usqp=CAE", 11000),

        ],
      ),
    );
  }
}
class Produto extends StatefulWidget {
  String? nome;
  String? img;
  double valor =0;
  double total =0;
  int cont =0;
  Produto(this.nome, this.img, this.valor)

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
