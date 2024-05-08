import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart';

void main() async{
  runApp(MaterialApp(home: Home()));


final database = openDatabase(join(await getDatabasesPath(), 'products.db'),
onCreate: (db, version){
  db.execute('CREATE TABLE products(id INTEGER PRIMARY KEY, nome TEXT, qtde INTEGER, valor FLOAT)');
}, version: 1);

Future<void> insertproducts(Products products) async{
  final db = await database;
  db.insert('products', products.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Products>> products() async{
  final db = await database;
  final List<Map<String, Object?>> productsMaps = await db.query('products');
  return[
    for(final {
      'id': id as int,
      'nome': nome as String,
      'qtde': qtde as int,
      'valor': valor as double
    } in productsMaps)
    Products(id: id, nome: nome, qtde: qtde, valor: valor)
  ];
}

Future<void> updateProducts(Products products)async{
  final db = await database;
  await db.update('products', products.toMap(), where: 'id = ?', whereArgs: [products.id]);
}

Future<void> deleteDog(int id) async{
  final db = await database;
  await db.delete('products', where: 'id = ?', whereArgs: [id]);
  print("Deletando Dado");
}

var arroz = Products(
  id: 1, 
  nome: 'Arroz', 
  qtde: 13, 
  valor: 3.5
);

var leite = Products(
  id: 2, 
  nome: 'Leite Italac', 
  qtde: 30, 
  valor: 1.5
);

var cereal = Products(
  id: 3, 
  nome: 'Cereal Snow Flakes', 
  qtde: 2, 
  valor: 2.85
);

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP BD"),
      ),
      body: Column(
        children: [
          Text("App Banco de dados de produtos"),
        ],
      ),
    );
  }
}

class Products{
  final int id;
  final String nome;
  final int qtde;
  final double valor;

  Products({required this.id, required this.nome, required this.qtde, required this.valor});
  Map<String, Object?> toMap(){
    return{
      'id': id,
      'nome': nome,
      'qtde': qtde,
      'valor':valor
    };
  }
  @override
  String toString(){
    return 'Dog{id: $id, nome: $nome, qtde: $qtde, valor: $valor}';
  }
}