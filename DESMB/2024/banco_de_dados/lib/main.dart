import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async{
  runApp(MaterialApp(
    home: Home(),
  ));

  final database =  openDatabase(join(await getDatabasesPath(), 'dogs.db'),
    onCreate: (db, version){
      db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)');
    }, version: 1);
  
    Future<void> insertDog(Dog, dog) async{
      final db = await database;
    
      db.insert('dogs', dog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
     Future<List<Dog>> dogs() async {
    final db = await database;

    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    return [
      for (final {
            'id': id as int,
            'nome': nome as String,
            'idade': idade as int,
          } in dogMaps)
        Dog(id: id, nome: nome, idade: idade),
      ];
    }

    Future<Void> updateDog(Dog, dog) async{
      final db =  await database;
      await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
    }
    
    Future<Void> deleteDog(int id) async{
      final db =  await database;
      await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
    }

    var Rocky = Dog(
      id: 1,
      nome: 'Rocky',
      idade: 2
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
          Text("App Banco de dados"),
        ],
      ),
    );
  }
}

class Dog{
  final int id;
  final String nome;
  final int idade;

  Dog({required this.id, required this.nome, required this.idade});

  Map<String, Object?> toMap(){
    return{
      'id':id,
      'nome':nome,
      'idade':idade,
    };
  }
  @override
  String toString(){
    return 'Dog{id: $id, nome: $nome, idade: $idade}';
  }
}