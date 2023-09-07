// orientação a objeto 
//classe

//Cria a classe chamada casa
class casa {
  String? cor;
  double? valor;

  void abrirPorta(){
  print("Porta Aberta");
  }

  void abrirJanela(){
    print("Janela Aberta");
  }
  void abrirCasa(bool st){
    if(st == true){
      this.abrirPorta();
      this.abrirJanela();
    }
    else{
      print("Janela fechada");
      print("Porta fechada");
    }
  }
}

void main(){
  // instancia o objeto chamado casa
  casa minhacasa = casa();
  minhacasa.valor = 12500.00;
  // para acessar um atributo da classe precisa colocar um ponto 
  minhacasa.cor = "Azul";
  print("A cor da minha casa é ${minhacasa.cor}");
  minhacasa.abrirJanela();
  minhacasa.abrirPorta();
  minhacasa.abrirCasa(true);
}