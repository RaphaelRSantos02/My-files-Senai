import 'package:flutter/material.dart';
import 'package:restaurante/cardapio.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});
  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemBuilder: (context,index){
          return Highlights()
        },
        ),
    );
  }
}
