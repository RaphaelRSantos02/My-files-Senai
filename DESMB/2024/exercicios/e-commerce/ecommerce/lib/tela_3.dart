import 'package:flutter/material.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area do Administrador"),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}

class compras extends StatefulWidget {
  const compras({super.key});

  @override
  State<compras> createState() => _comprasState();
}

class _comprasState extends State<compras> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}