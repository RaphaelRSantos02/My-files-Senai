import 'dart:io';
double fundos = 200.00;

void transacao(String tipo, double valor){
  if (fundos >= valor){
      fundos -= valor;
      print("$valor realizado com sucesso");
  }
  else {
    print("Você não possui saldo para fazer $valor");
  }
}

void menu(){
    String escolha = "", tipo = "";
  print("Deseja fazer qual transação bancárias ? [pix], [saque], [Empréstimos], [Transferências]");
  escolha = stdin.readLineSync()!;
  if (['pix','saque','emprestimo', 'transferencia'].contains(escolha)){
    switch(escolha){
      case 'pix': tipo = 'pix';  break;
      case 'saque': tipo = 'saque'; break;
      case 'emprestimo': tipo = 'emprestimo'; break;
      case 'transferencia': tipo = 'transferencia'; break;
    }
  }

  print("Digite o valor para transação de $tipo");
  var valor = double.parse(stdin.readLineSync()!);

  transacao(tipo, valor);
}



void main(){
  menu();

}
