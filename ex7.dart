import 'dart:io';

void main(){
  int op;
  print("Escolha a operação");
  print("1- saque");
  print("2- Deposito");
  print("3- Transferencia");
  print("4- PIX");
  print("Digite sua operação: ");
  op = int.parse(stdin.readLineSync()!);
  switch(op){
    case 1: print('Saque'); break;
    case 2: print('Deposito'); break;
    case 3: print('Transferencias'); break;
    case 4: print('PIX'); break; 
  }
}