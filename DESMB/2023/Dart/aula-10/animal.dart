
class animal{
  String nome;
  String especie;
  String cor;
  double idade;
  animal(this.nome, this.especie, this.cor, this.idade);
  void peso(double peso){
    print("O peso do $nome é $peso kg");
  }
  void dormiu(){
    print("Shiuu o $nome dormiu");
  }
  void acordou(){
    print("ih, voce acordou $nome");
  }
}

class cachorro extends animal implements alimentar{
  cachorro(String nome, String especie, String cor, double idade):super(nome, especie, cor, idade);

  
  void separarIngredientes(){
    print("Separando os ingredientes para o animal $nome");
  }
  void pegarTigela(){
    print("Pagando a tigela para o animal $nome");
  }
  void prepararComida(){
    print("preparando a comida para $nome");
  }
  void dormiu(){
    super.dormiu();
  }
  void acordou(){
    super.acordou();
  }
  void peso(double peso){
    super.peso(peso);
  }
}

class Passaro extends animal implements alimentar{
  Passaro(String nome, String especie, String cor, double idade):super(nome, especie, cor, idade);

  @override
  void separarIngredientes(){
    print("Separando os ingredientes para o animal $nome");
  }
  @override
  void pegarTigela(){
    print("Pagando a tigela para o animal $nome");
  }
  @override
  void prepararComida(){
    print("preparando a comida para $nome");
  }
  void dormiu(){
    super.dormiu();
  }
  void acordou(){
    super.acordou();
  }
  void peso(double peso){
    super.peso(peso);
  }
}

class tigre extends animal implements alimentar{
  tigre(String nome, String especie, String cor, double idade):super(nome, especie, cor, idade);

  @override
  void separarIngredientes(){
    print("Separando os ingredientes para o animal $nome");
  }
  @override
  void pegarTigela(){
    print("Pagando a tigela para o animal $nome");
  }
  @override
  void prepararComida(){
    print("preparando a comida para $nome");
  }
  void dormiu(){
    super.dormiu();
  }
  void acordou(){
    super.acordou();
  }
  void peso(double peso){
    super.peso(peso);
  }
}

class peixe extends animal implements alimentar{
  peixe(String nome, String especie, String cor, double idade):super(nome, especie, cor, idade);

  @override
  void separarIngredientes(){
    print("Separando os ingredientes para o animal $nome");
  }
  @override
  void pegarTigela(){
    print("Pagando a tigela para o animal $nome");
  }
  @override
  void prepararComida(){
    print("preparando a comida para $nome");
  }
  void dormiu(){
    super.dormiu();
  }
  void acordou(){
    super.acordou();
  }
  void peso(double peso){
    super.peso(peso);
  }
}


abstract class alimentar{
  void separarIngredientes();
  void pegarTigela();
  void prepararComida();
}

void main(){
  cachorro yorkshire = cachorro("zoe", "yorkshire", "cinza", 1.5);
  yorkshire.separarIngredientes();
  yorkshire.pegarTigela();
  yorkshire.prepararComida();
  yorkshire.peso(10);
  yorkshire.dormiu();
  yorkshire.acordou();
  Passaro jaiden = Passaro("jaiden", "paraguaio", "azul", 5);
  jaiden.dormiu();
  jaiden.peso(6);
  jaiden.acordou();
}