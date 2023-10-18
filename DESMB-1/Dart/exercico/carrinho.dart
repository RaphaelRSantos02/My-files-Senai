
class carrinho{
  List<String> itens = [];
  int? quantidades;

  void adicionar(String mais ){
    itens.add(mais);
    print(itens);
  }


  void remover(int menos){
    itens.removeAt(menos);
    print(itens);
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
  meucarrinho.adicionar("Maça");
  meucarrinho.adicionar("pera");
  meucarrinho.total(true);
  meucarrinho.remover(1);

}

