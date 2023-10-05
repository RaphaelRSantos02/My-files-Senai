
class animal{
  String nome;
  String especie;
  String cor;
  double idade;
  animal(this.nome, this.especie, this.cor, this.idade);
}

class cachorro extends animal implements alimentar{
  cachorro(String nome, String especie, String cor, double idade):super(nome, especie, cor, idade);

  void separarComida(){
    print("Separando comida para o animal $nome");
  }
  void pegarVasilha(){
    print("Pagando a vasilia para o animal $nome");
  }
  void comer(){
    print("O $nome está comendo");
  }
}

abstract class alimentar{
  void separarComida();
  void pegarVasilha();
  void comer();
}

void main(){
  cachorro yorkshire = cachorro("zoe", "yorkshire", "cinza", 1.5);
  yorkshire.separarComida();
  yorkshire.pegarVasilha();
  yorkshire.comer();
}