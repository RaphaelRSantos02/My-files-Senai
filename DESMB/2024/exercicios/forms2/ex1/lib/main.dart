import 'package:flutter/material.dart';

void main() {
  runApp(SM_Mobile());
}

class SM_Mobile extends StatelessWidget {
  const SM_Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectIndex = 0;
  static const List<Widget> _widgetOptions= <Widget> [
    Industria("imagens/industria.jpg"),
    Agricultura("imagens/agricultura-intensiva.jpg"),
    Saude("imagens/wiki-8-ambiente-promotor-de-saude.png"),
    economia("imagens/economia-real-o-que-e-como-funciona-e-como-investir-1-1024x693.jpg")
    
  ];
    void showItemTrap(int index){
    setState(() {
      selectIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SM Mobile"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
             bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Industria',
            backgroundColor: Color.fromARGB(255, 61, 123, 155),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: 'Agricultura',
            backgroundColor: Color.fromARGB(255, 66, 114, 138),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Saúde',
            backgroundColor: Color.fromARGB(255, 61, 114, 141),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Economia',
            backgroundColor: Color.fromARGB(255, 48, 88, 107),
          ),
          ],
           currentIndex: selectIndex,
        selectedItemColor: Colors.yellowAccent,
        onTap:showItemTrap ,
        )
    );
  }
}

class Industria extends StatefulWidget {
  final String img;
  const Industria(this.img, {super.key});

  @override
  State<Industria> createState() => _IndustriaState();
}

class _IndustriaState extends State<Industria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          Center(
            child: Image.asset(widget.img, fit: BoxFit.fill,)
          )
        ]
        ),
    );
  }
}
class Agricultura extends StatefulWidget {
  final String img;
  const Agricultura(this.img, {super.key});

  @override
  State<Agricultura> createState() => _AgriculturaState();
}

class _AgriculturaState extends State<Agricultura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          Center(
            child: Image.asset(widget.img, fit: BoxFit.fill,)
          )
        ]
        ),
    );
  }
}

class Saude extends StatefulWidget {
  final String img;
  const Saude(this.img, {super.key});

  @override
  State<Saude> createState() => _SaudeState();
}

class _SaudeState extends State<Saude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          Center(
            child: Image.asset(widget.img, fit: BoxFit.fill,)
          )
        ]
        ),
    );
  }
}

class economia extends StatefulWidget {
  final String img;
  const economia(this.img, {super.key});

  @override
  State<economia> createState() => _economiaState();
}

class _economiaState extends State<economia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          Center(
            child: Image.asset(widget.img, fit: BoxFit.fill,)
          )
        ]
        ),
    );
  }
}
