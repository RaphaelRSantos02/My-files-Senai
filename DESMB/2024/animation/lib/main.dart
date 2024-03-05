import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AnimatedContainerApp());
}

double widght = 50;
double height = 50;
Color color = Colors.blueGrey;
BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

class AnimatedContainerApp extends StatefulWidget {


  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App animation"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child: AnimatedContainer(
                width: widght,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius
                  ),
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
              ),
            ),
            FloatingActionButton(onPressed: (){
              setState(() {
                final random = Random();
                height = random.nextDouble() * 300;
                widght = random.nextDouble() * 300;
                color = Color.fromARGB(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
                borderRadius =BorderRadius.circular(random.nextDouble() * 100);
              });
            }, child: Icon(Icons.play_arrow),),
            Snack_bar(),
          ] 
          ),
        ),
    );
  }
}

class Snack_bar extends StatelessWidget {
  const Snack_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      final snack = SnackBar(
        content: Text("Exemplo Snackbar"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: (){

        }),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }, child: Text("Mensagem"));
  }
}