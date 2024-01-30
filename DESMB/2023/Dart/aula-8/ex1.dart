// orientação a objeto 
//classe

//Cria a classe chamada casa
class Casa {
  String? cor;
  double? valor;

  void abrirJanela(int qtde_janela)
  {
    print("Abrir janelas, qtde de janelas $qtde_janela");
  }
  
  void abrirPorta(int qtde_portas){
  print("Portas Aberta: $qtde_portas");
  }
  void abrirCasa(){
      this.abrirPorta(2);
      this.abrirJanela(2);
  }
}

  void main(){
    Casa minhaCasa = Casa();
    minhaCasa.cor = "Azul";
    print(minhaCasa.cor);
    minhaCasa.abrirJanela(4);
    minhaCasa.abrirPorta(2);
    minhaCasa.abrirCasa();
    Casa imovel1 = Casa();
    imovel1.cor = "vermelho";
    print(imovel1.cor);
    imovel1.valor = 550.00;
    print("O valor do imovel 1 é de R\$ ${imovel1.valor}");
  }
