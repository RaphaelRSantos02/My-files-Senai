import 'package:flutter/material.dart';

class admin extends StatelessWidget {
  const admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area do Administrador"),
      ),
      body: Column(
          children: [
            produto("PS5", "https://m.media-amazon.com/images/I/612SFC+tsbL._AC_SX342_SY445_.jpg", 3000),
            produto("Iphone", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSMtnJ7_VIZEW8HeMPHD144gt_tnrSIMrOxzYmixoRNl7UF-IjSBqIastqUiOuBnwujMW_6v2oFVBrKiwD46Vypd5Xt-IAvGp031HDjRdze01sjk2hT58dbAh4&usqp=CAE", 11000),

          ],
      ),
    );
  }
}

class produto extends StatefulWidget {
  String? nome;
  String? img;
  double? valor;
  produto(this.nome, this.img, this.valor);

  @override
  State<produto> createState() => _produtoState();
}

class _produtoState extends State<produto> {
  int cont = 1;
  _incrementar(){
    setState(() {
    cont++;
    });
  }
  _decrementar(){
      setState(() {
        if(cont>0){
          cont--;
        }
        else{
          cont = 0;
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 150, height: 100, child: Image.network("${widget.img}", fit: BoxFit.fill),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start, 
                children:[
                Text("${widget.nome}", style: TextStyle(fontSize: 18),),
                Text("Qtde: $cont", style: TextStyle(fontSize: 18),),
                Text("Valor: ${widget.valor}", style: TextStyle(fontSize: 18),),

            
                ]           
                ),
            )

          ],
        ),
      

 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: _incrementar, child: Icon(Icons.add)),
                    ),
                    ElevatedButton(onPressed: _decrementar, child: Icon(Icons.remove))
                    
                ],
                
              ),
      ],
    );
  }
}

