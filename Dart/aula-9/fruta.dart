class Alimento{
  String nome;
  String sabor;
  double peso;
  Alimento(this.nome, this.sabor, this.peso);
}
class fruta extends Alimento {  // herdando os parametros da class alimento

  int diaDaColheita;

  //construtor
  fruta(String nome, String sabor, double peso, this.diaDaColheita):super(nome,sabor, peso); // pega os parametros da classe pai (precisa colocar o super)


void madura(int isMadura)
{
  if(isMadura >= diaDaColheita){
    print("A fruta $nome está madura");
  }
  else{
    print("A fruta $nome não está madura");
  }
}
}

class Legume{ // não está herdando os parametros da classe alimento
  String nome;
  String sabor;
  double peso;

  Legume(this.nome, this.sabor, this.peso);
  void precisaCozinhar(bool isCozinhar){
    if (isCozinhar == true){
      print("O legome $nome precisa cozinhar");
    }
    else{
      print("O legome $nome não precisa cozinhar");
    }
  }

}

void main()
{
  //passagem de parametros através do construtor
  fruta Laranja = fruta("Laranja", "doce", 100, 10);
  Laranja.madura(5);
  fruta uva = fruta("Uva", "doce", 5, 20);
  uva.madura(25);

  Legume beterraba = Legume("beterraba", "doce", 150);
  beterraba.precisaCozinhar(true);
}