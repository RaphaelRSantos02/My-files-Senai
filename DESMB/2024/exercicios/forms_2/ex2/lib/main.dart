import 'package:flutter/material.dart';

void main() {
  runApp(food_screen());
}

class food_screen extends StatelessWidget {
  const food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return food();
  }
}

class food extends StatefulWidget {
  const food({super.key});

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  int selectIndex = 0;
  static const List<Widget> _widgetOptions= <Widget> [

    
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
        title: Text("Comidas tipicas"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
             bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Espanha',
            backgroundColor: Color.fromARGB(255, 255, 238, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'França',
            backgroundColor: Color.fromARGB(255, 2, 0, 136),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Coreia do sul',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'bangladesh',
            backgroundColor: Color.fromARGB(255, 2, 77, 27),
          ),
          ],
           currentIndex: selectIndex,
        selectedItemColor: Colors.yellowAccent,
        onTap:showItemTrap ,
        )
    );
  }
}

class Espanha extends StatefulWidget {
  final String img;
  const Espanha(this.img, {super.key});

  @override
  State<Espanha> createState() => _EspanhaState();
}

class _EspanhaState extends State<Espanha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Center(
            child: Image.asset(widget.img, fit: BoxFit.fill,)
          )
        ]
        ),
    );
  }
}
class franca extends StatefulWidget {
  final String img;
  const franca(this.img, {super.key});

  @override
  State<franca> createState() => _francaState();
}

class _francaState extends State<franca> {
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

class coreia extends StatefulWidget {
  final String img;
  const coreia(this.img, {super.key});

  @override
  State<coreia> createState() => _coreiaState();
}

class _coreiaState extends State<coreia> {
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

class bangladesh extends StatefulWidget {
  final String img;
  const bangladesh(this.img, {super.key});

  @override
  State<bangladesh> createState() => _bangladeshState();
}

class _bangladeshState extends State<bangladesh> {
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
