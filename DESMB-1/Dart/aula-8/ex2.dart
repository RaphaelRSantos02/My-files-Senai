class carro{
  String? cor;
  int? ano;
  String? combustivel;
  String? modelo;

  void iniciar(bool st){
    if(st ==true){
    print("carro ligado");
    }
    else{
      print("carro desligado");
    }
  }

  void janelas(bool st){
    if(st == true){
      print("Janelas do carro abertas");
    }
    else{
      print("janelas do carro desligada");
    }
  }

}


void main(){
  carro meucarro = carro();
  meucarro.cor = "Vermelho";
  meucarro.ano = 2019;
  meucarro.combustivel = "gasolina";
  meucarro.modelo = "mondel";
  meucarro.iniciar(true);
  meucarro.janelas(true);
  print("a cor do meu carro é: ${meucarro.cor}");
  print("O ano do meu carro é: ${meucarro.ano}");
  print("O combustivel é: ${meucarro.combustivel}");
  print("O modelo do meu carro é: ${meucarro.modelo}");

}