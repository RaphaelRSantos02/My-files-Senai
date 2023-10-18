class Produto {
  String _nome = "switch";
  double _preco = 1850.20;
  int _qtd = 3;
  String get nome{
    print(_nome);
    return this._nome;
  }
  double get preco{
    print(_preco);
    return this._preco;
  }
  int get qtd{
    print(_qtd);
    return this._qtd;
  }
}

void main(){
  Produto produto = Produto();
  produto.nome;
  produto.preco;
  produto.qtd;
}