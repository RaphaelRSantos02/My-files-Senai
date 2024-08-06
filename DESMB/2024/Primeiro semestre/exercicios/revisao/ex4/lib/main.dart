import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mange Grade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _nome = TextEditingController();
  final _primeiraNota = TextEditingController();
  final _segundaNota = TextEditingController();
  final _terceiraNota = TextEditingController();
  final _quartaNota = TextEditingController();
  String text = 'Sua media vai aparecer aqui';
  double media = 0.0;
  
  void calcMean() {
    setState(() {
      media = (double.parse(_primeiraNota.text)+double.parse(_segundaNota.text)+double.parse(_terceiraNota.text)+double.parse(_quartaNota.text))/4;
      text = " media do ${_nome.text}: $media";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nome,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu nome: '
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _primeiraNota,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite sua primeira nota: ',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _segundaNota,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite sua segunda nota: ',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _terceiraNota,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite sua terceira nota: ',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _quartaNota,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite sua quarta nota: ',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: calcMean,
                child: const Text('Calcular'),
              ),
            ),
            Text(text)
          ],
        ),
      )
    );
  }
}