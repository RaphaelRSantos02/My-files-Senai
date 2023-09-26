import 'dart:io';

class carrinho{
  List<String> itens = [];
  int? quantidades;

  void adicionar(String mais ){
    itens.add(mais);
  }

  }
  void remover(int menos){
    itens.remove(menos);
    }

  void total(bool st){
    if(st == true){
      quantidades = itens.length;
      print("esse é o numero de itens no carrinho $quantidades");
    }
    else{
      print("");
    }
  }
}

void main(){
  carrinho meucarrinho = carrinho();
  meucarrinho.adicionar(true);
}

