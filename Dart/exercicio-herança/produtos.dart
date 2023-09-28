class Produtos{
  String nome;
  int quantidade;
  double preco;
  String comunicacao;
  double consumo;
  Produtos(this.nome, this.quantidade, this.preco, this.comunicacao, this.consumo);

  void ligar(){
    print("O produto $nome esta ligado");
  }
  void desligar(){
    print("O produto $nome está desligado");
  }
  void ajuste_temp(double temp){
    print("$nome ajustou a temperatura para $temp");
  }
}

class fritadeira extends Produtos{
  fritadeira(String nome, int quantidade, double preco, String comunicacao,double consumo): super(nome,quantidade,preco,comunicacao, consumo);
  void ligar(){
    super.ligar();
  }
  void desligar(){
    super.desligar();
  }
  void ajuste_temp(double temp){
    super.ajuste_temp(temp);
  }
}

class televisao extends Produtos{
  televisao(String nome, int quantidade, double preco, String comunicacao,double consumo): super(nome,quantidade,preco,comunicacao, consumo);
  void ligar(){
    super.ligar();
  }
  void desligar(){
    super.desligar();
  }
  void ajuste_temp(double temp){
    super.ajuste_temp(temp);
  }
}

class ar_condicionado extends Produtos{
  ar_condicionado(String nome, int quantidade, double preco, String comunicacao,double consumo): super(nome,quantidade,preco,comunicacao, consumo);
  void ligar(){
    super.ligar();
  }
  void desligar(){
    super.desligar();
  }
  void ajuste_temp(double temp){
    super.ajuste_temp(temp);
  }
}

void main(){
  fritadeira Fritadeira = fritadeira("fritadeira", 5, 20.90, "não sei", 0.2); 
  Fritadeira.ligar();
  Fritadeira.desligar();
  Fritadeira.ajuste_temp(50);
  televisao Samsung = televisao("Samsung", 2, 5000.00, "wifi", 1);
  Samsung.ligar();
  Samsung.desligar();
  ar_condicionado ar = ar_condicionado("ar", 1, 2000.00, "controle", 10);
  ar.ligar(); 
  ar.desligar();
  ar.ajuste_temp(28);
}