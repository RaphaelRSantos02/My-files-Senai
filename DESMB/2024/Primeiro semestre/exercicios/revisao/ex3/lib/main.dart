import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
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
          title: const Text('Esporte'),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                Sport('Cristiano Ronaldo', 'imagens/Cristiano_Ronaldo_2018.jpg', 39, 1200),
                Sport('Vini Jr', 'imagens/vini-jr.jpg', 23, 985),
                Sport('mbappe', 'imagens/mbappe-real-madrid-1.jpg', 25, 1000),
                const SizedBox(
                  height: 110,
                )
              ],
            )
          ],
        )
    );;
  }
}

class Sport extends StatefulWidget {
  final String name;
  final String img;
  final int goals;
  final int age;

  Sport(this.name, this.img, this.age, this.goals, {super.key});

  @override
  State<Sport> createState() => SportState();
}

class SportState extends State<Sport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Idade: ${widget.age}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Gols marcados: ${widget.goals}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
