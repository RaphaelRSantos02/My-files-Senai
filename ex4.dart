import 'dart:io';

void main(){

  int n1, n2, n3, multiplicacao;

  print("Digite seu numero: ");
  n1 = int.parse(stdin.readLineSync()!);

  print("Digite seu segundo numero: ");
  n2 = int.parse(stdin.readLineSync()!);
  
  print("Digite seu terceiro numero: ");
  n3 = int.parse(stdin.readLineSync()!);

  multiplicacao = n1 * n2 * n3;
  print("O resultado $multiplicacao");

}