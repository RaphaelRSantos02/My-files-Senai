class maquina{
  String nome;
  int Qtds_eixo;
  double RPM;
  double consumo_energia;
  maquina(this.nome, this.Qtds_eixo, this.RPM, this.consumo_energia);

  void ligar(){
    print("Maquina ligada");
  }
  void desligada(){
    print("maquina desligada");
  }
  void rotacao(double RPM_novo)
  print("A nova rotação por minuto agora é de $RPM_novo");
}

class furadeira extends maquina{
  furadeira(String nome, double RPM, double consumo_energia): super(nome, RPM, consumo_energia);
  void ligar(){
    super.ligar();
  }
  void desligada(){
    super.desligada();
  }
  void rotacao(double RPM_novo){
    super.rotacao(RPM_novo);
  }
}

void main(){

}
