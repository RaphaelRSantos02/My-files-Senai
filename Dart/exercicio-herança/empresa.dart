class pessoa{
  String name;
  int idade;
  String profissao;
  double salario;
  pessoa(this.name, this.idade, this.profissao, this.salario);

  void  exibetrabalho(String nomeempresa, int tempo_de_trabalho){
    print("O nome da empresa é $nomeempresa, tempo de horas trabalhadas: $tempo_de_trabalho ");

  }
}

void main(){
  pessoa Thiago = pessoa("Thiago", 18, "desenvolvedor", 1200.50);
  Thiago.exibetrabalho("bosch", 12);
}