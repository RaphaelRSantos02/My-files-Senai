class Pessoa{
  String _nome = "Raphael";
  int _idade = 18;
  String get nome{
    print(_nome);
    return this._nome;
  }
  int get idade {
    print(_idade);
    return this._idade;
  }

  set idade(int idade ){
    if(idade >= 18 && idade <= 60 ){
      idade = this._idade;
      print("Voce é adulto");
    }
    else{
      print("Voce não é adulto");
    }
  }
}

void main(){
Pessoa pessoa = Pessoa();
pessoa.nome;
pessoa.idade;
}