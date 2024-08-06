import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _consultaprecoBitcoin () async{
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> dados = json.decode(response.body);
    print(response.statusCode.toString());
    setState(() {
    _precobit =dados["BRL"]["buy"].toString();
    });
    print(_precobit)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("conversations"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: _consultaprecoBitcoin, child: Text("verificar")),
          ],
        ),
      ),
    );
  }
}