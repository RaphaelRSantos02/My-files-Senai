class maquina{
  String nome;
  int Qtds_eixo;
  double RPM;
  double consumo_energia;
  maquina(this.nome, this.Qtds_eixo, this.RPM, this.consumo_energia);
}

class furadeira extends maquina{
  furadeira(String nome, double RPM, double consumo_energia): super(nome, RPM, consumo_energia);
}