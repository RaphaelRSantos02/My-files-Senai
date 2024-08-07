import 'package:flutter/material.dart';

void main() {
  runApp(Tela());
}

class Tela extends StatelessWidget {
  const Tela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Telaresponsive(),
    );
  }
}

class Telaresponsive extends StatelessWidget {
  const Telaresponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final midiaquerydata = MediaQuery.of(context);
    final screen_height = MediaQueryData().size.height;
    final screen_width = MediaQueryData().size.width;

    final isMobile = screen_width < 600;
    final isTablet = screen_width >= 600 && screen_width < 1024;
    final isDesktop = screen_width >= 1024;

    return Scaffold(
      appBar: AppBar(
        title: Text("App tela responsiva"),
      ),
      drawer: isMobile
          ? Drawer(
            child: ListView(
              children: [
                
              ],
            ),
          ),
    );
  }
}
