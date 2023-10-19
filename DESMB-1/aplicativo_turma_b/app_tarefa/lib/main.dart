import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title:Text('Aplicativo Tarefas'),
          ),
          body: Column(
            children: [
              Task(),
              Task(),
              Task(),
              Task(),
            ],
          ),
          )
    );
  }
}


class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white, 
          child: Stack(
            children: [
            Container(color: Colors.blue,height: 140,),
            Container(color: Colors.white, height: 100,
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.grey,height: 100, width: 80),
                Text('Aprender Flutter', style: TextStyle(fontSize: 22),),
                ElevatedButton(onPressed: (){print("Botão pressionado");}, 
                child: Icon(Icons.arrow_drop_up))
              ],
            ),),
          ],
        ),
      );
  }
}