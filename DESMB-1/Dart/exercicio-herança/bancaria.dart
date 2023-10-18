class cliente{
  String nome;
  String profissao;
  double saldo;
  cliente(this.nome, this.profissao, this.saldo);
  void Pix(double valor){
    saldo = saldo - valor;
    print("Pix realizado com sucesso, saldo atual: $saldo");
  }
  void Emprestimo(double valor){
    saldo = valor + saldo;
    print("emprestimo realizado com sucesso, saldo atual: $saldo");
  }
  void Saque(double valor){
    saldo = saldo - valor;
    print("Saque realizado com sucesso, saldo atual: $saldo");
  }
  void extrato(){
    print("O extrato da sua conta é $saldo");
  }
}

void main(){
  cliente Diggo = cliente("Diggo", "youtuber", 100000.00);
  Diggo.Pix(200);
  Diggo.Emprestimo(150);
  Diggo.Saque(400);
  Diggo.extrato();
}