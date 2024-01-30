//função com passagem de parametros opcionais
import 'dart:io';

void exibir_dados(String? nome, {String? cpf, String? salario}){
  print("nome: $nome");
  print("CPF: $cpf");
  print("Salario: $salario");
}

void main() {
  print("Digite seu nome: ");
  String? entrada = stdin.readLineSync()!;
  print("Digite seu cpf:");
  String? CPF = stdin.readLineSync()!;
  print("Digite seu salario: ");
  String? sal = stdin.readLineSync()!;

  exibir_dados(entrada, cpf: CPF, salario: sal);
}