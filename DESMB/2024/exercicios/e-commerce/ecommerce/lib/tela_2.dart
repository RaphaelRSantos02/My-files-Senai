import 'package:ecommerce/tela_3.dart';
import 'package:flutter/material.dart';

class cliente extends StatefulWidget {
  const cliente({super.key});

  @override
  State<cliente> createState() => _clienteState();
}

class _clienteState extends State<cliente> {
  int n_estoque = 0;
  int v = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compras"),
      ),
      body: ListView(
       scrollDirection: Axis.vertical,
        children: [
            produto("PS5", "https://m.media-amazon.com/images/I/612SFC+tsbL._AC_SX342_SY445_.jpg", 3000),
            produto("Iphone", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSMtnJ7_VIZEW8HeMPHD144gt_tnrSIMrOxzYmixoRNl7UF-IjSBqIastqUiOuBnwujMW_6v2oFVBrKiwD46Vypd5Xt-IAvGp031HDjRdze01sjk2hT58dbAh4&usqp=CAE", 11000),

        ],
      ),
    );
  }
}
class Produto extends StatefulWidget {
  String? nomeproduto;
  String? img;
  int? qtde;
  double valor = 0;
  double total =0;
  int cont =0;

   Produto(this.nomeproduto, this.img, this.qtde,this.valor );

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  double? v;
    int cont=0;
   List<Produto> telas=[
    Produto("PS5", "https://m.media-amazon.com/images/I/612SFC+tsbL._AC_SX342_SY445_.jpg",0, 3000),
    Produto("Iphone", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSMtnJ7_VIZEW8HeMPHD144gt_tnrSIMrOxzYmixoRNl7UF-IjSBqIastqUiOuBnwujMW_6v2oFVBrKiwD46Vypd5Xt-IAvGp031HDjRdze01sjk2hT58dbAh4&usqp=CAE",0, 11000),

   ];

  _incrementprod(){
    setState(() {
      cont ++;
    });
    

  }
  _decrementprod(){
    setState(() {
      cont--;
    });
  }

  
  double calctotalcompra(){
  double total =0;
  for(Produto telas in telas){
    total+=telas.total;

  }
  return total;
  }
  _exibircalc(){
    setState(() {
      v= calctotalcompra();
      print(v);
    });
  
}
    
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 150,height: 100,color: Colors.grey,
            child: Image.network("${widget.img}",fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                Text("${widget.nomeproduto}",style: TextStyle(fontSize: 18),),
                                 
                Text("Quantidade $cont",style: TextStyle(fontSize: 18)),
                  
                  
                  Text("Valor ${widget.valor}",style: TextStyle(fontSize: 18)),
                  
              Row(
                      children: [
              Text("Qtde: ",style: TextStyle(fontSize: 18),),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: _incrementprod, child: Icon(Icons.add)),
              ),
              ElevatedButton(onPressed: _decrementprod, child: Icon(Icons.restore)),
             
             
                      ],
                    ),
                ],
                
              ),
            ),
           
          ],
        ),
       
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed:_exibircalc, child: Text("Calcular")),
              ),
                  ElevatedButton(onPressed: (){}, child: Text("Limpar")),
                  Text("Valor total R\$ ${v}",style: TextStyle(fontSize: 18),),
                ],
              ),
         Text("${calctotalcompra()}",)  
      ],
    );
    
  }
}

